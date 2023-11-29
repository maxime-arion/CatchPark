class ChangeUserToParkings < ActiveRecord::Migration[7.1]
  def change
    remove_reference :parkings, :user, foreign_key: true
    add_reference :parkings, :user, null: true, foreign_key: true
  end
end
