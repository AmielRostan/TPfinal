class AddUserIdToRent < ActiveRecord::Migration[6.1]
  def change
    add_reference :rents, :user, null: false, foreign_key: true
  end
end
