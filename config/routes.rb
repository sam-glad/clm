require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resources :searches, only: [:index, :new, :create, :show, :destroy]

  authenticate :user, lambda {|u| u.admin? } do
    mount Sidekiq::Web, at: '/sidekiq'
  end

  root to: 'searches#index'
end
