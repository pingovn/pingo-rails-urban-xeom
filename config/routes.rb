Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :drivers
  resources :drivers do
  	collection do
  	  post :search, to: 'drivers#index'
  	end
  	member do 
  	  put 'like', to: 'drivers#upvote'
  	  put 'dislike', to: 'drivers#downvote'	
  	end
  end

  root to: 'visitors#index'
  devise_for :users
end
