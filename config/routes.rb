Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "find", to: "packages#find"
  get "received", to: "packages#received"
  get "profile", to: "users#profile"
  resources :packages, only: [:show, :update]
  resources :addresses, only: [:index, :show]
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
