Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products, only: :index

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
