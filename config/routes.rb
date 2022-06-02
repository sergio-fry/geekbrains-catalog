Rails.application.routes.draw do
  resources :items
  resources :categories do
    member do
      post :activate
    end
  end

  root "home#index"
end
