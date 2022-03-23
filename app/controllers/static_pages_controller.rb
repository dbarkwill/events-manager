class StaticPagesController < ApplicationController
  helper_method :total_checkins
  helper_method :total_walkins
  helper_method :total_rsvp
  helper_method :checked_in_percentage

  before_action :authorized, only: [:admin]

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

  protected
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
