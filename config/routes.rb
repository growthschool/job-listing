Rails.application.routes.draw do

  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end
    end
  end

  devise_for :users

  resources :jobs do
    resources :resumes
  end

 root 'jobs#index'

 end
