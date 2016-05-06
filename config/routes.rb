Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, :only => [:show]

  get 'politicians/local' => 'politicians#local'
  get 'politicians/state' => 'politicians#state'
  get 'politicians/national' => 'politicians#national'
  resources :politicians

  authenticated do
    root :to => 'politicians#index', as: :authenticated
  end
  root :to => 'dashboard#home'


  resources :posts do
    resources :comments
  end
  # get '/politicians/local' => '/politicians#local'
  # get '/politicians/state' => '/politicians#state'
  # get '/politicians/national' => '/politicians#national'

end
