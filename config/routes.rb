Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users' }
  resources :users, only: [] do
    member do
      patch 'update_vehicle'
    end
  end
  root to: "pages#home"
  get 'welcome', to: 'pages#welcome'
  get 'onboarding_step_two', to: 'pages#onboarding_step_two', as: :onboarding_step_two
  resources :parkings

  get 'vehicle_registration', to: 'users#new_vehicle', as: :new_vehicle_registration
  patch 'vehicle_registration', to: 'users#update_vehicle', as: :vehicle_registration

end
