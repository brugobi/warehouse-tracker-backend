Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items, only: %i[index create show update destroy]

      post 'authenticate', to: 'authentication#create'
    end
  end
end
