require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resources :searches, only: [:index, :new, :create, :show, :destroy, :edit,
                              :update, :home] do
    resources :posts, only: [:show]
  end

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web, at: '/sidekiq'
  end

  root to: 'searches#main'
end
