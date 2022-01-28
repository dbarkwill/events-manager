class StaticPagesController < ApplicationController
  def home
    @customers = Customer.all
    @employee = Employee.new
  end

  def admin
  end
end
