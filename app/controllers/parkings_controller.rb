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
    @parking = Parking.find(params[:id])
  end

  def new
    @parking = Parking.new
  end

  def create
    @parking = Parking.new(parking_params)
    @parking.status = false # La place est initialement occupée
    @parking.start_time = Time.current # Définit le start_time sur l'heure actuelle
    @parking.end_time = @parking.start_time + @parking.duration.hours # Ajoute la durée au start_time pour obtenir end_time

    if @parking.save
      redirect_to parking_path(@parking), notice: 'Emplacement créé et marqué comme indisponible.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @parking.destroy
    redirect_to parkings_path, notice: 'Le stationnement a été supprimé avec succès.'
  end

  def update
    if @parking.update(parking_params)
      update_status_based_on_duration
      redirect_to @parking, notice: 'Le stationnement a été mis à jour avec succès.'
    else
      render :edit
    end
  end

  private

  def set_parking
    @parking = Parking.find(params[:id])
  end

  def parking_params
    params.require(:parking).permit(:duration, :address, :status_checkbox)
  end

  def update_status_based_on_duration
    # Mettez en œuvre la logique pour mettre à jour le statut en fonction de la durée ici
    # Par exemple, si la durée est présente, marquez le parking comme non disponible
    @parking.update(status: @parking.duration.present?)
  end
end
