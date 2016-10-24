Rails.application.routes.draw do
  # get 'resumes/index'
  #
  # get 'resumes/new'
  #
  # get 'resumes/create'
  #
  # get 'resumes/destroy'

  devise_for :users
  # resources :resumes, only: [:index, :new, :create, :destroy]
  resources :jobs do
    resources :resumes
  end
  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'jobs#index'
  #resources :resumes

end
