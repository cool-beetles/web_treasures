Rails.application.routes.draw do

  resources :treasures

  root 'treasures#index/:id'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
