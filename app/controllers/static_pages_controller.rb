class StaticPagesController < ApplicationController
  def home
    @customers = Customer.all
  end

  def admin
  end
end
