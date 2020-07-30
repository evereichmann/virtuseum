Rails.application.routes.draw do
  root to: 'pages#home'
  
  resources :museums
  resources :exhibits
  resources :collections
  resources :items
  resources :users
  resources :curators, only: [:new, :edit, :create, :update]
  resources :loans, only: [:new, :edit, :create, :update]

  patch '/sessions/reset_page', to: 'sessions#reset_page', as: 'session_reset'
  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  post '/sessions', to: 'sessions#login', as: 'login'
  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
