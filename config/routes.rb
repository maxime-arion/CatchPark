Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  # Use resources for RESTful routes
  resources :parkings

  # Use the standard new and create actions for creating a new parking
  get 'create_new_parking', to: 'parkings#new', as: 'create_new_parking'
  post 'create_parking', to: 'parkings#create', as: 'create_parking'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Uncomment the following line if you want to define a root path route ("/")
  # root "posts#index"
end
