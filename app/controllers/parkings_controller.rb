class ParkingsController < ApplicationController
  before_action :set_parking, except: [:index, :new, :create]

  def index
    @parkings = Parking.all
    @markers = @parkings.map do |parking|
      {
        lat: parking.latitude,
        lng: parking.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { parking: parking })
      }
    end
  end

  def show
  end

  def new
    @parking = Parking.new
  end

  def create
    @parking = Parking.new(parking_params)
    if @parking.save
      redirect_to parking_path(@parking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # Utilisation du before_action pour définir @parking
  end

  def update
    if @parking.update(parking_params)
      redirect_to @parking, notice: parking_notice_message
    else
      render :edit
    end
  end

  private

  def set_parking
    @parking = Parking.find(params[:id])
  end

  def parking_params
    params.require(:parking).permit(:address, :price, :status, :start_time, :end_time, :duration, :user_id)
  end

  def parking_notice_message
    "Parking updated successfully."
  end

end
