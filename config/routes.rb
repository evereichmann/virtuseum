Rails.application.routes.draw do
  resources :curators
  resources :museums
  resources :exhibits
  root to: 'pages#home'
  
  resources :collections
  resources :items
  resources :users

  patch '/sessions/reset_page', to: 'sessions#reset_page', as: 'session_reset'
  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  post '/sessions', to: 'sessions#login', as: 'login'
  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
