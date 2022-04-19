Rails.application.routes.draw do
  resources :tickets
  resources :bookings
  resources :vehicles
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount_devise_token_auth_for 'User', at: 'auth'

  get '/booked_tickets', to: 'purchase#booked_tickets'
  get '/expired_tickets', to: 'purchase#expired_tickets'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
