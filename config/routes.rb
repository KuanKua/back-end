Rails.application.routes.draw do
  get 'auth/register'

  get "/directories/recentfive", to: "directories#recentfive"
  post "/users/:id/regenerate", to: "users#regenerate"
  
  resources :user_votes
  resources :directories
  resources :contributions
  resources :experts
  resources :users
  resources :activities

  resources :words
  resources :phrases
  resources :characters
  resources :sentences
  resources :longtexts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/register", to: "auth#register"
  post "/login", to: "auth#login"

  get "directories/:id/words", to: "directories#words"
  get "directories/:id/phrases", to: "directories#phrases"
  get "directories/:id/sentences", to: "directories#sentences"
  get "directories/:id/characters", to: "directories#characters"
  get "directories/:id/longtexts", to: "directories#longtexts"

  get "users/:id/following", to: "users#following"
  get "users/:id/followEachOther", to: "users#followEachOther"
  get "users/:id/notFollowing", to: "users#notFollowing"
  get "users/:id/noFriendship", to: "users#noFriendship"

  post "users/:id1/follow/:id2", to: "users#follow"
  post "users/:id1/unfollow/:id2", to: "users#unfollow"

  get "users/:id/activities", to: "users#activities"
  get "activities/:id/daysPassed", to: "activities#daysPassed"
  
  patch "/profile", to: "users#show"
  patch "/users/:id", to: "users#update"

  delete "/users/:id", to: "users#delete"

  post "/directories/:id/increaseview", to: "directories#increaseView"

  post "/words/:word_id/approve/:user_id", to: "words#approve"
  post "/words/:word_id/disapprove/:user_id", to: "words#disapprove"

  get "/words/:word_id/votes/:user_id", to: "words#votes"

  get "/directories/:id/export", to: "directories#export"

  get "/users/:id/directories", to: "users#directories"

  


end
