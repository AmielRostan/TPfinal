class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.text :description
      t.integer :kilometres
      t.date :begins_at
      t.date :ends_at

      t.timestamps
    end
  end
end
