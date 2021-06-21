class Vehicle < ApplicationRecord
  belongs_to :category
  belongs_to :brand

  paginates_per 30

  validates :patent, presence: true, uniqueness: true
  validates :model, presence: true
  validates :fuel, presence: true
  validates :kilometres, presence: true
  validates :value, presence: true


  def maintenance
    lastkm = self.kilometres
    Service.all.each do |service|
      if service.vehicle_id == self.id
        lastkm = lastkm - service.kilometres
      end
    end
    if lastkm > 10000
      return true
    else
      return false
    end
  end
end
