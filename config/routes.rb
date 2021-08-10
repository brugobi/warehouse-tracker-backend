Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items, only: %i[index create show update destroy]
      resources :users
      post 'authenticate', to: 'authentication#create'
      post 'register', to: 'users#create'
    end
  end
end
