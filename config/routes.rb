Rails.application.routes.draw do
  get 'treasures/trash'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/register' => 'accounts#new'
  post '/register' => 'accounts#create'
  get '/welcome' => 'welcome#index'

  resources :types, only: [:index]
  
  resources :treasures do
    resources :rentals, only: [:new, :create]
  end

  resources :storages
  resources :rentals, only: [:index, :update]

  root 'welcome#index'

end
