require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)

  resources :users

  resources :items
  resources :categories do
    member do
      post :activate
    end
  end

  root "home#index"

  mount RootApi => "/api"
  mount Sidekiq::Web => "/sidekiq"
end
