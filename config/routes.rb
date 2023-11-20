Rails.application.routes.draw do
  devise_for :users
  root to: 'resipes#index'

  resources :resipes

end
