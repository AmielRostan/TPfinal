class Brand < ApplicationRecord
  has_many :vehicles

  validates :name, presence: true, uniqueness: true
end
