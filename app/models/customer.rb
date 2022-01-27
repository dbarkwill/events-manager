class Customer < ApplicationRecord
  has_many :registrations
  has_many :check_ins
  validates :customer_number, presence: true

  def self.search(search)
    if search
      customers = Customer.where("barcode = ? OR address LIKE '%#{search}%'", search)
    else
      customers = Customer.all
    end
    return customers
  end
end
