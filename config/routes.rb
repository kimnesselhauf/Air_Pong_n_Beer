Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/ediget 'users/update'
  devise_for :users
  root to: 'pages#home'

  resources :listings
  resources :users
end
