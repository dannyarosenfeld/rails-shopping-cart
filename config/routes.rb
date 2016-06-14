Rails.application.routes.draw do
  resources :items
  root 'items#index'

  get '/admin', :to => 'items#admin'

end
