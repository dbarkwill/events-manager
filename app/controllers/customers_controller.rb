class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]
  require 'csv'

  # GET /customers or /customers.json
  def index
    @customers = Customer.search(params[:search])
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  def lookup
      if turbo_frame_request?
        @customers = Customer.search(params[:search])
        render partial: "customers", locals: { customers: @customers }
      end
  end

  # POST /customers/import
  def import
    customers = []
    CSV.foreach(params[:file], headers: true) do |row|
      customers << row.to_h
    end
    Customer.import(customers)
    redirect_to root_url, notice: "Customers have been imported"
  end

  # POST /customers/import_reg
  def import_reg
    CSV.foreach(params[:file], headers: true) do |row|
      puts row
      @customer = Customer.find_by customer_number: row["customer_number"]
      @customer.update row.to_h
    end
    redirect_to root_url, notice: "Customers have been updated."
  end

  # GET /customers/export_attendance
  def export_attendance
      @customers = Customer.filter_by_checked_in(true)
      respond_to do |format|
        format.html
        format.csv { send_data @customers.to_csv, filename: "customers_checked_in-#{Date.today}.csv" }
      end
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    if turbo_frame_request?
      if @customer.update(customer_params)
        @customers = @customer
        render partial: "customers", locals: { customers: @customers }
      end
    else
      respond_to do |format|
        if @customer.update(customer_params)
          format.html { redirect_to customer_url(@customer), notice: "Customer was successfully updated." }
          format.json { render :show, status: :ok, location: @customer }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @customer.errors, status: :unprocessable_entity }
        end
      end
    end
    ActionCable.server.broadcast('customer_channel', {dinner_delta: dinner_delta, checked_in_count: checked_in_count})
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:customer_number, :name, :phone_number, :search, :address, :file, :checked_in, :registered, :registered_at_event, :dinner_count, :phys_address, :co, :actual_dinner_count, :empdir, :member_number)
    end
end
