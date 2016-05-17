Rails.application.routes.draw do
  root "disputes#index"
  resources :disputes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :dispute_activations, only: :edit
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
end
