Rails.application.routes.draw do
  # root 'items#index'
  namespace :api do
    namespace :v1 do
      resources :items
      resources :users
      resources :authenticate, only: [:create]
    end
  end
end
