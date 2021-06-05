Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :items, only: %i[index create show update destroy]
    end
  end
end
