class CreateParkings < ActiveRecord::Migration[7.1]
  def change
    create_table :parkings do |t|
      t.integer :longitude
      t.integer :latitude
      t.boolean :price
      t.boolean :status
      t.date :start_time
      t.time :end_time
      t.time :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
