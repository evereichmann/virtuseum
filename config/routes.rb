Rails.application.routes.draw do
  resources :curators
  resources :museums
  resources :exhibits
  root to: 'pages#home'
  
  resources :collections
  resources :items
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
