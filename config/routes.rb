Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  get 'users/show'

  root "disputes#index"
  resources :disputes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:new, :create]
end
