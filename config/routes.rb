Rails.application.routes.draw do
  root to: "sessions#login"

  get "/overview" => "clubs#overview"

  resources :users, only: [:update] do
  end
  
  get "/account" => "users#manage_account"
  get "/library" => "books#completed"

  resources :sessions, only: [:create, :destroy]

  get "/meetings/:id/edit" => "meetings#edit"
  get "/meetings/new" => "meetings#new"
  post "/meetings" => "meetings#create"
  put "/meetings/:id" => "meetings#update"

  resources :books, only: [] do
    member do
      post "/mark_read" => "books#mark_read"
    end
  end

  resources :nominations, only: [:new, :create, :destroy, :index, :update] do
    member do
      delete "/downvote" => "nominations#downvote", as: "downvote"
    end
  end
end
