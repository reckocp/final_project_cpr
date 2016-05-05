Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'dashboard#home'
  resources :politicians do
    get "local"
  end

  resources :posts
  resources :comments
  # get '/politicians/local' => '/politicians#local'
  # get '/politicians/state' => '/politicians#state'
  # get '/politicians/national' => '/politicians#national'

end
