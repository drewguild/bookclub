Rails.application.routes.draw do
  root to: "sessions#login"

  resources :sessions, only: [:create, :destroy]

  resources :nominations, only: [:new, :create, :index, :update] do
    member do
      delete "/downvote" => "nominations#downvote", as: "downvote"
    end
  end
end
