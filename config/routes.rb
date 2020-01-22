Rails.application.routes.draw do
  root to: "sessions#login"

  resources :sessions, only: [:create]

  resources :nominations, only: [:new, :create, :index] do

  end
end
