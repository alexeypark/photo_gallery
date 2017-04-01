Rails.application.routes.draw do
  root 'photos#index'
  resources :photos
  ActiveAdmin.routes(self)
  devise_for :users
end
