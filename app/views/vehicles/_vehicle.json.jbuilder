json.extract! vehicle, :id, :category_id, :patent, :brand, :model, :fuel, :kilometres, :value, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
