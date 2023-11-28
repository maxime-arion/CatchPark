class ParkingsController < ApplicationController
  before_action :set_parking, only: [:show, :edit, :update]

  def index
    @parkings = Parking.all
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

  def parking_params
    # Ajoutez ici les paramètres autorisés lors de la mise à jour du parking
    params.require(:parking).permit(:nom, :adresse, :capacite, :autre_attribut)
  end
end
