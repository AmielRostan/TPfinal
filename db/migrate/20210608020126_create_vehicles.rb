class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.references :category, null: false, foreign_key: true
      t.string :patent
      # t.string :brand
      t.string :model
      t.string :fuel
      t.integer :kilometres
      t.integer :value

      t.timestamps
    end
  end
end
