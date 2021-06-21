class Person < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :document_number, presence: true, uniqueness: true
  validates :direction, presence: true
  validates :phone, presence: true
  validates :card, presence: true, uniqueness: true


  paginates_per 30


  def full_name
    first_name + ", " + last_name
  end
end
