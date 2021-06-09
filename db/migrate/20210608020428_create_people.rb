class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.integer :document_number
      t.string :direction
      t.integer :phone
      t.integer :card

      t.timestamps
    end
  end
end
