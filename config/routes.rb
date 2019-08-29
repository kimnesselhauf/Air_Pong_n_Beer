Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/ediget 'users/update'
  devise_for :users
  root to: 'pages#home'

  resources :listings do
    resources :bookings, only: %i[new create edit update]
    get 'listings/:listing_id/bookings/confirm', to: 'bookings#confirm', as: 'confirm_booking'
  end
  resources :users
  resources :bookings, only: [:destroy]

end
