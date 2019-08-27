Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :listings do
    resources :bookings, only: %i[new create]
  end
end
