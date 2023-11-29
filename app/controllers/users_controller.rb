# app/controllers/users_controller.rb

class UsersController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update_vehicle]

  def edit
  end

  def new_vehicle
  end

  def update_vehicle
    if @user.update(user_params)
      redirect_to root_path, notice: 'Vehicle information updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:vehicle_type, :vehicle_plate, :vehicle_name)
  end
end
