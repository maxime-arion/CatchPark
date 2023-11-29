class ParkingsController < ApplicationController
  before_action :set_parking, only: [:show, :edit, :update]

  def index
    @parking = Parking.all
    @markers = @parking.geocoded.map do |parking|
      {
        lat: parking.latitude,
        lng: parking.longitude
      }
    end
  end

  def show
    # Utilisation du before_action pour définir @parking
  end

  def new
    @parking = Parking.new
  end

  def edit
    # Utilisation du before_action pour définir @parking
  end

  def update
    if @parking.update(parking_params)
      if !@parking.occupied
        redirect_to @parking, notice: 'Place occupée avec succès.'
      else
        redirect_to @parking, notice: 'Place libérée avec succès.'
      end
    else
      render :edit
    end
  end

  private

  def set_parking
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
