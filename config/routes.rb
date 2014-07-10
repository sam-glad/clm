Rails.application.routes.draw do
  devise_for :users
  resources :searches, only: [:index, :new, :create]
  root to: "searches#index"
end
