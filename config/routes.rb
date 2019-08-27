Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/ediget 'users/update'
  devise_for :users
  root to: 'pages#home'
  
  resources :listings do
    resources :bookings, only: %i[new create]
  end
  resources :users

end
