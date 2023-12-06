class Parking < ApplicationRecord
  belongs_to :user, optional: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  def status_checkbox
    status ? '1' : '0'
  end

  def status_checkbox=(value)
    self.status = value == '1'
  end
end
