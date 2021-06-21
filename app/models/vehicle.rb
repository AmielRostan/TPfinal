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
  # def self.filterfromto(from, to)  # FILTRA DESDE UNA FECHA A LA OTRA
  #   vehicles = []
  #   if (from == "" ) or (to == "")
  #     vehicles = Vehicle.all
  #   else
  #     from = from.to_date
  #     to = to.to_date
  #     for r in Rent.all
  #       condition = 0
  #       if (r.ends_at.to_date > from)
  #         condition = condition + 1
  #       end
  #       if (r.ends_at.to_date < to)
  #         condition = condition + 1
  #       end
  #       if (condition == 2)
  #         vehicles.push(r.vehicle)
  #       end
  #     end
  #     vehicles
  #   end
  # end
end
