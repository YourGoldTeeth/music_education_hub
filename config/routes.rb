Rails.application.routes.draw do
  resources :homeworks
  resources :assignments
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get 'index' => 'homepage#index'

get 'assignments' => 'assignments#index'

get 'homeworks' => 'homeworks#index'

root 'homepage#index'

# root "home#index"

end
