Rails.application.routes.draw do

  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end
      resources :resumes
    end
  end

  devise_for :users

  resources :jobs do
    resources :resumes
  end

  #resources :resumes
  root 'jobs#index'
end
