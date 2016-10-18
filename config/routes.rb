Rails.application.routes.draw do
  resources :jobs
  devise_for :users
  root 'jobs#index'
end
