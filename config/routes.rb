Rails.application.routes.draw do
  root 'photos#index'
  resources :photos do
    resources :comments, :only => [:create, :destroy]
  end
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users, :only => [:show]
end
