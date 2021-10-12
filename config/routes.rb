Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items
      resources :users
      resources :authentication, only: [:create]
    end
  end
end
