class ApplicationController < ActionController::Base
  helper_method :current_employee
  helper_method :current_admin
  helper_method :dinner_delta
  helper_method :checked_in_count
  helper_method :attendee_count
  helper_method :total_checkins
  helper_method :total_walkins
  helper_method :total_rsvp
  helper_method :checked_in_percentage


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
    @dinner_delta = ((Setting.purchased_meal_count.to_i - Customer.filter_by_rsvp(true).sum(:dinner_count).to_i) - (Customer.filter_by_checked_in(true).sum(:actual_dinner_count).to_i - Customer.filter_by_checked_in(true).sum(:dinner_count).to_i))
  end

  def attendee_count
    @attendee_count = Customer.filter_by_checked_in(true).sum(:attendees).to_i
  end

  def checked_in_count
    @checked_in_count = Customer.filter_by_checked_in(true).count.to_i
  end

  def total_checkins
    return Customer.filter_by_checked_in(true).count
  end

  def total_walkins
    return Customer.filter_by_registered_at_event(true).count
  end

  def total_rsvp
    return Customer.filter_by_rsvp(true).count
  end

  def checked_in_percentage
    if Customer.filter_by_rsvp(true).count == 0
      return "0.0"
    else
      return ((Customer.filter_by_rsvp(true).filter_by_checked_in(true).count.to_f / Customer.filter_by_rsvp(true).count.to_f) * 100).round(2)
    end
  end

end
