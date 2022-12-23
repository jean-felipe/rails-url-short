Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :users, param: :username
  post '/auth/login', to: 'authentication#login'
  get '/:code', to: 'short_urls#show'

  root to: 'short_url#index'

  resources :short_urls, only: [:create, :index]
end
