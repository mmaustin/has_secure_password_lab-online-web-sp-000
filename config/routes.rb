Rails.application.routes.draw do

  resources :sessions, only: [:new, :create]
  resources :users, only: [:new, :create]
  get '/', to: 'users#show'
  root 'users#show'

end
