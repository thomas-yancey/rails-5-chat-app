Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  get 'welcome/index'

  root to: 'welcome#index'
  resources :users, only: [:new, :index, :create]
  resources :sessions, only: [:new, :destroy]

  resources :rooms, except: [:update, :edit] do
    resources :memberships, only: [:index, :create]
  end

  resources :messages, only: [:create]
  post '/sessions/login', to: "sessions#create"

end
