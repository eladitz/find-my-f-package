Rails.application.routes.draw do
  scope "(:locale)", :locale => /en|de/ do

    devise_for :users
    root to: "pages#home"
    get "about", to: "pages#about"
    get "find", to: "packages#find"
    post "find", to: "packages#find"
    get "received", to: "packages#received"
    get "packages/:id/availability", to: "packages#availability", as: "availability"
    get "profile", to: "users#profile"
    get "print_page/:id", to: "users#print_page", as: "print_page"
    get "users/adding_profile_form", to: "users#adding_profile_form", as: "adding_profile_form"
    patch "users/adding_profile_info", to: "users#adding_profile_info", as: "adding_profile_info"
    get "addresses/new", to: "addresses#new", as: "user_address"

    resources :packages
    resources :addresses
    resources :chatrooms, only: :show do
      resources :messages, only: :create
    end
  end
end
