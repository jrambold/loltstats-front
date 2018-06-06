Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2', as: :google_oauth2_login
  get '/auth/google_oauth2/callback', to: 'sessions#create'

  resources :users, only: ['new', 'show', 'create']
  resources :teams, only: ['index', 'show', 'new', 'create']
end
