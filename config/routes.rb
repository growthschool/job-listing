Rails.application.routes.draw do
  devise_for :users
  resources :lists 
  root 'welcome#index'
end
