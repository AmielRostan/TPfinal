class AddBrandToVehicle < ActiveRecord::Migration[6.1]
  def change
    add_reference :vehicles, :brand, null: false, foreign_key: true
  end
end
