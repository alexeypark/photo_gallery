Rails.application.routes.draw do
  root 'photos#index'
  resource :photos
  ActiveAdmin.routes(self)
  devise_for :users
end
