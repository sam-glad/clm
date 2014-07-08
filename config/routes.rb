Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index' # TODO root to a real page
end
