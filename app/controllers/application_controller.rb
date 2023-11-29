class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :vehicle_name, :vehicle_type, :vehicule_plate])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :vehicle_name, :vehicle_type, :vehicule_plate])
  end
end
