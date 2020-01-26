Rails.application.routes.draw do
  root to: "sessions#login"

  resources :sessions, only: [:create, :destroy]

  resources :nominations, only: [:new, :create, :index, :update] do

  end
end
