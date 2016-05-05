Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, :only => [:show]
  resources :politicians
  match 'politicians/local' => 'politicians#local', :via => :get
  match 'politicians/state' => 'politicians#local', :via => :get
  match 'politicians/national' => 'politicians#local', :via => :get
  authenticated do
    root :to => 'politicians#index', as: :authenticated
  end
  root :to => 'dashboard#home'


  resources :posts
  resources :comments
  # get '/politicians/local' => '/politicians#local'
  # get '/politicians/state' => '/politicians#state'
  # get '/politicians/national' => '/politicians#national'

end
