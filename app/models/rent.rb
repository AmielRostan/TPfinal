class Rent < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user

  paginates_per 30

  validate :overlapping_rents
  validate :overlapping_services
  validates :begins_at, presence: true
  validates :ends_at, presence: true
  validates :pay, presence: true
  validates :kilometres, presence: true
  validates :return, presence: true



  def overlapping_rents
    Rent.all.each do |rent|
      # Logica para que no se superpongan reservas de vehiculos.
      if self.begins_at.between?(rent.begins_at, rent.ends_at) && (self.vehicle.id == rent.vehicle.id) && (self.id != rent.id)
        puts "*** Este vehiculo ya esta reservado en este dia (ID: #{rent.id} - FECHA: #{rent.begins_at} - #{rent.ends_at}) *** "
        errors.add(:begins_at, 'Este vehiculo YA TIENE una reserva asignada en esta fecha')
        break
      elsif self.ends_at.between?(rent.begins_at, rent.ends_at) && (self.vehicle.id == rent.vehicle.id) && (self.id != rent.id)
        puts "*** Este vehiculo ya esta reservado en este dia (ID: #{rent.id} - FECHA: #{rent.begins_at} - #{rent.ends_at}) *** "
        errors.add(:ends_at, 'Este vehiculo YA TIENE una reserva asignada en esta fecha')
      end
    end
    puts "*** Reserva agendada con exito ***"
  end

  def overlapping_services
    Service.all.each do |service|
      # Logica para que no se superpongan reservas de vehiculos.
      if self.begins_at.between?(service.begins_at, service.ends_at) && (self.vehicle.id == service.vehicle.id)
        puts "*** Este vehiculo ya esta en servicio en este dia (ID: #{service.id} - FECHA: #{service.begins_at} - #{service.ends_at}) *** "
        errors.add(:begins_at, 'Este vehiculo YA TIENE un servicio asignada en esta fecha')
        break
      elsif self.ends_at.between?(service.begins_at, service.ends_at) && (self.vehicle.id == service.vehicle.id) && (self.id != service.id)
        puts "*** Este vehiculo ya esta en servicio en este dia (ID: #{service.id} - FECHA: #{service.begins_at} - #{service.ends_at}) *** "
        errors.add(:ends_at, 'Este vehiculo YA TIENE un servicio asignada en esta fecha')
      end
    end
    puts "*** Servicio agendado con exito ***"
  end

  def payment
    if ends_at.nil? || begins_at.nil?
      return 0
    else
      totalpay = (self.ends_at - self.begins_at).to_i
      totalpay = totalpay * vehicle.value
      return totalpay
    end
  end


end
