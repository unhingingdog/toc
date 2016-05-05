Rails.application.routes.draw do
  root "disputes#index"
  resources :disputes, only: [:index, :new, :create, :show, :edit, :update]
end
