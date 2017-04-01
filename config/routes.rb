Rails.application.routes.draw do
  get 'comments/new'

  get 'comments/create'

  get 'comments/destroy'

  root 'photos#index'
  resources :photos do
    resources :comments
  end
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users, :only => [:show]
end
