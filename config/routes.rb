Rails.application.routes.draw do
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'items#welcome'
  resources :items do
    resources :comments
  end
  
  
  # Google
  get 'sessions/create'
  get 'sessions/destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  
  resources :sessions, only: [:create, :destroy]

  get 'users/rate'
  post 'users/rating'
  resources :users, only: [:rate, :rating]
  
  # Contact form
  match '/contacts', to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]
  
  #admin Page
  get 'admin', to: 'admin'
  get 'controlpanel', to:'items#welcome'
  resources :admin
  
  #No custom URL for security purpose
  match '*path', to: redirect('/'), via: :all
  
end