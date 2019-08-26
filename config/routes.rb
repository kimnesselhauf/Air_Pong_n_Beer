Rails.application.routes.draw do
  get 'listings/index'
  get 'listings/show'
  get 'listings/new'
  get 'listings/edit'
  devise_for :users
  root to: 'pages#home'

  resources :listings
end
