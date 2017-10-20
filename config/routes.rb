Rails.application.routes.draw do

  resources :welcome
  resources :profiles
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD

=======
  root  "profiles#index"
>>>>>>> 887713f99b8d1d57bef0a769a83476d31622fbce
end
