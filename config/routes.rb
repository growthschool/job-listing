Rails.application.routes.draw do
  get 'admin/jobs'

  resources :jobs
  root 'jobs#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
