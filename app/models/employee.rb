class Employee < ApplicationRecord
  has_many :check_ins
  validates :first_name, presence: true
  validates :last_name, presence: true
end
