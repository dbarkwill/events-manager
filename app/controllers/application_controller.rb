class ApplicationController < ActionController::Base
  helper_method :current_employee
  helper_method :current_admin

  def current_employee
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end

  def current_admin
    @current_admin ||= Employee.find_by(id: session[:employee_id], is_admin: true) if session[:employee_id]
  end
end
