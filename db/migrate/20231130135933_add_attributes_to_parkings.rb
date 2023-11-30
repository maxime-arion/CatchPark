class AddAttributesToParkings < ActiveRecord::Migration[7.1]
  def change
    add_column :parkings, :address, :string
  end
end
