class Registration < ApplicationRecord
  belongs_to :customer
  has_many :check_ins
  validates :dinner_count, presence: true
end
