Rails.application.routes.draw do
  resources :nominations, only: [:new, :create, :index] do

  end
end
