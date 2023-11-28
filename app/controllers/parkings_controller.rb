class ParkingsController < ApplicationController
  def index
    @parkings = Parking.all
  end
  def show
    @parking = Parking.find(params[:id])
  end
  def create
  @parking = Parking.new(parking_params)
    if @parking.save
    redirect_to parking_path(@parking)
    else
    render "parkings/show", status: :unprocessable_entity
    end
  end
end
