class Category < ApplicationRecord
  has_many :vehicles

  paginates_per 30

  validates :name, presence: true, uniqueness: true
end
