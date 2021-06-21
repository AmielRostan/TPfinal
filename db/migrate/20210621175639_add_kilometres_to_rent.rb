class AddKilometresToRent < ActiveRecord::Migration[6.1]
  def change
    add_column :rents, :kilometres, :integer
  end
end
