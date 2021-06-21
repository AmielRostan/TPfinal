class AddCustomFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :document_number, :integer
    add_column :users, :direction, :string
    add_column :users, :phone, :integer
    add_column :users, :card, :integer
  end
end
