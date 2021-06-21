Rails.application.routes.draw do
  resources :brands
  get 'firstlook/new'
  get 'firstlook/create'
  resources :rents
  resources :services
  resources :vehicles
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'firstlook#new'
end
