class Customer < ApplicationRecord
  validates :customer_number, presence: true
  scope :filter_by_checked_in, -> (checked_in) {where checked_in: checked_in}
  require 'csv'

  def self.search(search)
    if search
      customers = Customer.where("customer_number = ? OR address LIKE '#{search} %' OR phys_address LIKE '#{search} %'", search)
    else
      customers = Customer.all
    end
    return customers
  end

  def self.to_csv
    attributes = %w{customer_number name dinner_count registered_at_event}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |customer|
        csv << attributes.map{ |attr| customer.send(attr)}
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Customer.create! row.to_hash
    end
  end
end
