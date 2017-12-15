Rails.application.routes.draw do

  root 'tables#index'

  resources :tables, only: [:index]
  resources :reservations, only: [:index, :show, :new, :create]
end
