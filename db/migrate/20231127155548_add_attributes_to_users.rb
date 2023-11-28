class AddAttributesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :vehicle_name, :string
    add_column :users, :vehicle_type, :string
    add_column :users, :vehicle_plate, :string
  end
end
