class RegistrationsController < ApplicationController
  before_action :set_registration, only: %i[ show edit update destroy ]

  # GET /registrations or /registrations.json
  def index
    @registrations = Registration.all
  end

  # GET /registrations/1 or /registrations/1.json
  def show
  end

  # GET /registrations/new
  def new
    @customer = Customer.find params[:customer_id]
    @registration = Registration.new(:customer=>@customer)

  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations or /registrations.json
  def create
    if Registration.where(customer_id: registration_params[:customer_id]).count > 0
        redirect_to :controller => 'customers', :action => 'lookup', notice: "Customer is already registered."
    else
      @registration = Registration.new(registration_params)
      @customer = Customer.find registration_params[:customer_id]
      respond_to do |format|
        if @registration.save
          format.html { redirect_to customer_url(@customer), notice: "Registration was successfully created." }
          format.json { render :show, status: :created, location: @registration }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @registration.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /registrations/1 or /registrations/1.json
  def update
    respond_to do |format|
      if @registration.update(registration_params)
        format.html { redirect_to registration_url(@registration), notice: "Registration was successfully updated." }
        format.json { render :show, status: :ok, location: @registration }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1 or /registrations/1.json
  def destroy
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to registrations_url, notice: "Registration was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def registration_params
      params.require(:registration).permit(:customer_id, :date, :dinner_count)
    end
end
