Rails.application.routes.draw do
  devise_for :drivers
  resources :drivers do
  	collection do
  		get :search, to: 'drivers#index'
  	end
  end

  root to: 'visitors#index'
  devise_for :users
end
