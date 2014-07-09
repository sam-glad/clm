Rails.application.routes.draw do
  devise_for :users
  root to: "devise/sessions#new" # FIXME root to another page ASAP
end
