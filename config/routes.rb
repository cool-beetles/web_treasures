Rails.application.routes.draw do
  get 'treasures/trash'
  get 'sessions/login' => 'sessions#new'
  post 'sessions/login' => 'sessions#create'
  get 'sessions/logout' => 'sessions#destroy'
  get 'accounts/register' => 'accounts#new'

  resources :treasures
  resources :storages
  resources :welcome
  resources :sessions
  resources :accounts

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
