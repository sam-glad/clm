Rails.application.routes.draw do
  devise_for :users
  resources :searches, only: [:index, :new, :create, :show]
  root to: "searches#index"
end
