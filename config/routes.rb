Rails.application.routes.draw do
  root 'static_pages#home'

  get    '/users/:id', to: 'users#show', as: 'user'
  get    '/signup',    to: 'users#new'
  post   '/signup',    to: 'users#create'

  resources :events, only: [:new, :create, :show, :index]

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end