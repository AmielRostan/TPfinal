class RemoveFieldBrandFromVehicle < ActiveRecord::Migration[6.1]
  def change
    remove_column :vehicles, :brand, :string
  end
end
