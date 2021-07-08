Rails.application.routes.draw do
  root to: 'welcom#index'
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  resources :retirements
  
  resources :events do
    resources :tickets, only: [:new, :create, :destroy]
  end
end
