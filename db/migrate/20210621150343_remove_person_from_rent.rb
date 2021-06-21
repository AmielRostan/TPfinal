class RemovePersonFromRent < ActiveRecord::Migration[6.1]
  def change
    remove_reference :rents, :person, null: false, foreign_key: true
  end
end
