Rails.application.routes.draw do
  root 'static_pages#home'

  get '/about', to: 'static_pages#about'

  get     '/signup',        to: 'users#new'
  post    '/signup',        to: 'users#create'

  post    '/attend',        to: 'attendances#create'
  get     '/attend',        to: 'attendances#create'
  delete  '/unattend',      to: 'attendances#destroy'


  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'

  
  resources :sessions, only: [:create, :new, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:index, :new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
