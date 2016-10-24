Rails.application.routes.draw do
  get 'resumes/index'

  get 'resumes/new'

  get 'resumes/create'

  get 'resumes/destroy'

  devise_for :users
  resources :jobs
  resources :resumes, only: [:index, :new, :create, :destroy]
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

end
