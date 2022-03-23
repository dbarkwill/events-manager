class ApplicationController < ActionController::Base
  helper_method :current_employee
  helper_method :current_admin
  helper_method :dinner_delta
  helper_method :checked_in_count

  def current_employee
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end

  def current_admin
    @current_admin ||= Employee.find_by(id: session[:employee_id], is_admin: true) if session[:employee_id]
  end

  def admin?
    !current_admin.nil?
  end

  def authorized
    redirect_to '/login' unless admin?
  end

  def dinner_delta
    @dinner_delta = 100 - (Customer.filter_by_checked_in(true).sum(:actual_dinner_count).to_i - Customer.filter_by_checked_in(true).sum(:dinner_count).to_i)
  end

  def checked_in_count
    @checked_in_count = Customer.filter_by_checked_in(true).count.to_i
  end
end
