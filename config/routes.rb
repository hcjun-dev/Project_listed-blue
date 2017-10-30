Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'
  
  get 'auth/:provider/callback', to: 'sessions#create'
  
  get 'auth/failure', to: redirect('/')
  
  get 'signout', to: 'sessions#destroy', as: 'signout'
  
  
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'items#welcome'
  resources :items
  
end