class ActionsController < ApplicationController
    before_action :authorized
  
    def reset_registrations
        Customer.where.not(registered: nil).update_all(registered: nil,dinner_count: nil, voted: nil)
        redirect_to admin_url, notice: "Registrations successfully reset."
    end

    def reset_check_ins
        Customer.where.not(checked_in: nil).update_all(checked_in: nil,actual_dinner_count: nil, registered_at_event: nil)
        redirect_to admin_url, notice: "Check-ins successfully reset."
    end
  
    def reset_database
        Customer.delete_all
        redirect_to admin_url, notice: "Database successfully reset."
    end
    
  end