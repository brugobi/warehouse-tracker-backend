Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations'}
  namespace :api do
    namespace :v1 do
      resources :items, only: %i[index create show update destroy]
      get 'post/index'
      post :auth, to: 'authentication#create'
      post '/auth', to: 'authentication#fetch'
    end

  namespace :v2 do
    # Things yet to come
  end
  end
end
