class CreateRents < ActiveRecord::Migration[6.1]
  def change
    create_table :rents do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.date :begins_at
      t.date :ends_at
      t.string :pay

      t.timestamps
    end
  end
end
