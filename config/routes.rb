Rails.application.routes.draw do

  match '/auth/:provider/callback', :to => 'authentications#create', via: :get
#  root 'static_pages#home'
  root 'movies#index'

  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :movies
  resources :comments
  resources :authentications
end
