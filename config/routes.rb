Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "find", to: "packages#find"
  post "received", to: "packages#received"
  resources :packages, only: [:show, :update]
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
