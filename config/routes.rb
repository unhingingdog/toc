Rails.application.routes.draw do
  root "disputes#landing"
  get "/platform", to: "disputes#index"
  resources :disputes, only: [:index, :new, :create, :show,
                                                    :edit, :update, :destroy, :carousel] do
    member do
      put "yea" => "disputes#upvote"
      put "nay" => "disputes#downvote"
    end
  end
  resources :users, only: [:new, :create, :show]
  resources :dispute_activations, only: :edit
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
end
