Rails.application.routes.draw do
  get 'treasures/index'

  resources :treasures

  root 'treasures#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
