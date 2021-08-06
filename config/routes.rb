Rails.application.routes.draw do
  get 'auth/register'

  resources :user_votes
  resources :directories
  resources :contributions
  resources :experts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/register", to: "auth#register"
  post "/login", to: "auth#login"
  
  patch "/profile", to: "users#show"

end
