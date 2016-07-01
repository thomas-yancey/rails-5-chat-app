Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  get 'welcome/index'

  root to: 'welcome#index'
  resources :users, only: [:new, :index, :create]
  resources :groups, except: [:update, :edit]
  resources :sessions, only: [:new, :destroy]
  resources :rooms, except: [:update, :edit]
  resources :messages, only: [:create]
  post '/sessions/login', to: "sessions#create"

end
