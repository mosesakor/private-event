Rails.application.routes.draw do
  get 'users/index'
  root 'user#index'
  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
