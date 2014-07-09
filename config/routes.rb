Rails.application.routes.draw do
  devise_for :users
  resources :searches, only: [:index]
  root to: "searches#index"
end
