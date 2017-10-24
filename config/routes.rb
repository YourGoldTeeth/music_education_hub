Rails.application.routes.draw do
  get 'homepage/index'

  resources :assignments
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get 'index' => 'homepage#index'

get 'assignments' => 'assignments#index'

# root "home#index"

end
