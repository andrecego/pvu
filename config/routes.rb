require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :plants, only: [] do
        get 'search', to: 'plants#search'
      end
    end
  end

  root to: 'home#index'
  get '*all', to: 'home#index'
end
