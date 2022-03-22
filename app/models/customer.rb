class Customer < ApplicationRecord
  validates :customer_number, presence: true
  scope :filter_by_checked_in, -> (checked_in) {where checked_in: checked_in}
  
  attr_accessor :is_employee, :is_director

  require 'csv'

  def self.search(search)
    if search
      customers = Customer.where("customer_number = ? OR phys_address LIKE '#{search} %'", search)
    else
      customers = Customer.all.limit(200)
    end
    return customers
  end

  def self.to_csv
    attributes = %w{customer_number co name phys_address dinner_count actual_dinner_count registered_at_event voted}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |customer|
        csv << attributes.map{ |attr| customer.send(attr)}
      end
    end
  end

  def is_employee
    if self[:empdir]
      if self[:empdir].include? "X"
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def is_director
    if self[:empdir]
      if self[:empdir].include? "D"
        return true
      else
        return false
      end
    else
      return false
    end
  end
end
