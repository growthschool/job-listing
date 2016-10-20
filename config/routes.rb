Rails.application.routes.draw do
  devise_for :users
  resources :jobs

  namespace :admin do
    resources :jobs do
      member do
        post :hide_this_job
        post :publish_this_job
      end
    end

  end

  root "jobs#index"
end
