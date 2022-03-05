class StaticPagesController < ApplicationController
  def home
    @customers = Customer.all
    @employee = Employee.new
  end

  def admin
    @customer = Customer.new
    @employee = Employee.new
    @recent_checkins = Customer.filter_by_checked_in(true).order(updated_at: :desc).limit(20)
    @employees = Employee.all
  end
end
