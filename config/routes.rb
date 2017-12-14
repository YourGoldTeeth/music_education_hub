Rails.application.routes.draw do

  resources :transcriptions
  resources :resources
  resources :homeworks
  resources :assignments
  # devise_for :users
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

    devise_scope :users do
      get 'sign_up', to: 'users/registrations#new'
    end      

  # devise_for :users, :controllers => {:registrations => "registrations"}

  # get 'registrations/new'

  # get 'registrations/create'

  # get 'registrations/update'

  # get 'registrations/destroy'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get 'index' => 'homepage#index'

get 'assignments' => 'assignments#index'

get 'homeworks' => 'homeworks#index'

root 'homepage#index'

# root "home#index"

end
