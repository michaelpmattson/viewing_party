Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :users, only: [:new, :create]

  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  post   '/',       to: 'sessions#create'
  delete '/',       to: 'sessions#destroy', as: 'logout'

  get '/discover',  to: 'discover#index', as: 'discover'

  resources :movies, only: [:index, :show]
  resources :parties, only: [:new, :create]
end
