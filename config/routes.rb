Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :events
      resources :users
      resources :interests
      resource :auth, only: [ :create ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
  end
  
end