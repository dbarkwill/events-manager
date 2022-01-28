class SessionsController < ApplicationController
  def new
  end

  def create
    session_params = params.permit(:PIN)
    @employee = Employee.find_by(PIN: session_params[:PIN])
    if @employee
      session[:employee_id] = @employee.id
      redirect_to :controller => 'customers', :action => 'lookup'
    else
      redirect_to :controller => 'static_pages', :action => 'home'
    end
  end

  def destroy
    session[:employee_id] = nil
    redirect_to :controller => 'static_pages', :action => 'home'
  end
end
