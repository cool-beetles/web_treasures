Rails.application.routes.draw do
  get 'treasures/trash'
  get 'sessions/login' => 'sessions#new'
  post 'sessions/login' => 'sessions#create'
  get 'sessions/logout' => 'sessions#destroy'

  resources :treasures
  resources :storages
  resources :welcome
  resources :sessions

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
