Rails.application.routes.draw do
  root to: "sessions#login"

  get "/overview" => "clubs#overview"

  resources :users, only: [:update] do
  end
  
  get "/account" => "users#manage_account"

  resources :sessions, only: [:create, :destroy]

  get "/meetings/:id/edit" => "meetings#edit"
  get "/meetings/new" => "meetings#new"
  post "/meetings" => "meetings#create"
  put "/meetings/:id" => "meetings#update"

  resources :nominations, only: [:new, :create, :destroy, :index, :update] do
    member do
      delete "/downvote" => "nominations#downvote", as: "downvote"
    end
  end
end
