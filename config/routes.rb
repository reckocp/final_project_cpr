Rails.application.routes.draw do
  root 'dashboard#home'
  resources :politicians

end
