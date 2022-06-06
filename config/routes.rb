Rails.application.routes.draw do
  devise_for :users

  resources :users

  resources :items
  resources :categories do
    member do
      post :activate
    end
  end

  root 'home#index'

  mount RootApi => '/api'
end
