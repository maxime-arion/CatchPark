class Parking < ApplicationRecord
  belongs_to :user, optional: true
end
