Rails.application.routes.draw do


root  "profiles#index"
  get 'welcome/index'
  root "profiles#index"
  resources :welcome
  resources :profiles
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
