class AddReturnToRent < ActiveRecord::Migration[6.1]
  def change
    add_column :rents, :return, :boolean
  end
end
