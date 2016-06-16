Rails.application.routes.draw do

  resources :items
  resources :users
  resources :category

  root 'items#index'

  get '/admin', :to => 'items#admin'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
end
