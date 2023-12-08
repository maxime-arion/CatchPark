class Parking < ApplicationRecord
  belongs_to :user, optional: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

# app/models/parking.rb

# before_validation :set_default_status, on: :create

# def set_default_status
#   # Utilisez le statut fourni dans les seeds s'il est présent, sinon, définissez-le sur 'true'
#   self.status = status.present? ? status : true

#   # Définissez le start_time et le end_time uniquement si le statut est 'true'
#   if self.status
#     self.start_time = Time.current
#     self.end_time = start_time + duration.hours if start_time.present? && duration.present?
#   end
# end


  def status_checkbox
    status ? '1' : '0'
  end

  def status_checkbox=(value)
    self.status = value == '1'
  end
end
