Rails.application.routes.draw do
  get 'treasures/trash'

  resources :treasures
  resources :storages
  resources :welcome

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
