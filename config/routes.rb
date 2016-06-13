Rails.application.routes.draw do
  resources :items
  root 'welcome#index'

end
