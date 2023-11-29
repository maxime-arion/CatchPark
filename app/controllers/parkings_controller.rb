class ParkingsController < ApplicationController
  before_action :set_parking

  def index
    @parkings = Parking.all
  end

  def show
    # Utilisation du before_action pour définir @parking
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
    params.require(:parking).permit(:name, :location, :occupied)
  end

  def default_parking_attributes
    name = params[:name]
    location = params[:location]
    # Utilise le service de géocodage pour obtenir les coordonnées
    coordinates = Geocoder.search(location).first&.coordinates || [0, 0]

    { name: name, location: location, latitude: coordinates[0], longitude: coordinates[1] }
  end

  def parking_notice_message
    @parking.occupied ? "Place libérée par #{current_user.id}." : "Place occupée par #{current_user.id}."
  end
end
