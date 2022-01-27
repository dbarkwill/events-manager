class Customer < ApplicationRecord
  has_many :registrations
  has_many :check_ins
  validates :customer_number, presence: true
end
