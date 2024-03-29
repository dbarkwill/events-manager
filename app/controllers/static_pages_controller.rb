class StaticPagesController < ApplicationController
  before_action :authorized, only: [:admin]

  def home
    @customers = Customer.all
    @employee = Employee.new
  end

  def admin
    @customer = Customer.new
    @employee = Employee.new

    @employees = Employee.all
  end
  def dashboard
    @recent_checkins = Customer.filter_by_checked_in(true).order(updated_at: :desc).limit(20)
    render layout: 'dashboard'
  end

  def setup
    render layout: 'dashboard'
  end
  
end
