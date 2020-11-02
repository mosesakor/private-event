Rails.application.routes.draw do
  root 'sessions#new'

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'

  
  resources :sessions, only: [:create, :new, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:index, :new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
