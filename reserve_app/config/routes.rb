Rails.application.routes.draw do
  root 'rooms#top'
  get 'rooms/top'
  get 'rooms/search'
  resources :rooms
  resources :reservations

  devise_for :users
end
