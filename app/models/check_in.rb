class CheckIn < ApplicationRecord
  belongs_to :customer
  belongs_to :employee
  belongs_to :registration
end
