Rails.application.routes.draw do
  get 'treasures/trash'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/register' => 'accounts#new'
  post '/register' => 'accounts#create'
  get '/types' => 'types#index'

  resources :treasures
  resources :storages
  resources :welcome

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
