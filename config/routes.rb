Rails.application.routes.draw do
  resources :bookings, only: %i[new create index show]
  get "flights/index"

  root "flights#index"
end
