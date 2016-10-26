Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :users do
      member do
        post :king
        post :nobody
      end
    end
    resources :jobs do
      member do
        post :publish
        post :hide
      end
      resources :resumes
    end
  end


  resources :jobs do
    resources :resumes, only: [:index, :new, :create, :destroy]
  end
  root 'jobs#index'
end
