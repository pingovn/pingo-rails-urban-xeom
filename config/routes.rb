Rails.application.routes.draw do
  devise_for :drivers
  resources :drivers

  root to: 'visitors#index'
  devise_for :users
end
