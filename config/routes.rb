Rails.application.routes.draw do
  resources :bookings, only: %i[new create index]
  get "flights/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "flights#index"
end
