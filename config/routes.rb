Rails.application.routes.draw do

  resources :items
  resources :users
  resources :categories
  resources :carts

  root 'items#index'

  get '/admin', :to => 'items#admin'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  patch '/checkout' => 'carts#checkout'
end
