Rails.application.routes.draw do
  resources :parkings
  devise_for :users
  resources :users, only: [] do
    member do
      patch 'update_vehicle'
    end
  end
  root to: "pages#home"
  get 'welcome', to: 'pages#welcome'
  get 'onboarding_step_two', to: 'pages#onboarding_step_two', as: :onboarding_step_two
  get 'vehicle_registration', to: 'users#new_vehicle', as: :new_vehicle_registration
  patch 'vehicle_registration', to: 'users#update_vehicle', as: :vehicle_registration
  get 'profile', to: 'users#show', as: :user_profile
end
