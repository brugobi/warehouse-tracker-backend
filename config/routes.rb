Rails.application.routes.draw do
  # root 'items#index'
  namespace :api do
    namespace :v1 do
      resources :items
      resources :users
      post 'authenticate', to: 'authentication#create'
      post 'register', to: 'users#create'
    end
  end
end
