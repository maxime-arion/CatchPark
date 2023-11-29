class CreateParkings < ActiveRecord::Migration[7.1]
  def change
    create_table :parkings do |t|
      t.float :longitude
      t.float :latitude
      t.boolean :price
      t.boolean :status
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
