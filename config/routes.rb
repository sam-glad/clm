require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resources :searches, only: [:index, :new, :create, :show, :destroy]

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: "searches#index"
end
