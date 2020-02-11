Rails.application.routes.draw do
  root to: "sessions#login"

  resources :users, only: [:update] do
    
  end
  
  get "/account" => "users#manage_account"

  resources :sessions, only: [:create, :destroy]

  resources :nominations, only: [:new, :create, :destroy, :index, :update] do
    member do
      delete "/downvote" => "nominations#downvote", as: "downvote"
    end
  end
end
