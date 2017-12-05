Rails.application.routes.draw do
  get 'treasures/index'
  get 'treasures/show'
  get 'treasures/new'
  get 'treasures/create'

  resources :treasures

  root 'treasures#index/:id'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
