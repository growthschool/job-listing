Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

     resources :lists
     root 'lists#index'

     namespace :admin do
       resources :lists
     end
     


end
