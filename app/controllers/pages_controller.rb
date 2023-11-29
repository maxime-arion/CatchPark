class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @parkings = Parking.all

    @markers = @parkings.map do |parking|
      {
        lat: parking.latitude,
        lng: parking.longitude
      }
    end
  end
end
