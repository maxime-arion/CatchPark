class ParkingsController < ApplicationController
  before_action :set_parking

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

  def create
    @parking = Parking.new(parking_params)
    respond_to do |format|
      if @parking.save
        format.html { redirect_to parking_url(@parking), notice: "Parking was successfully created." }
        format.json { render :show, status: :created, location: @parking }
      # redirect_to parking_path(@parking)
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking.errors, status: :unprocessable_entity }
      # render :new, status: :unprocessable_entity
      end
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

end
