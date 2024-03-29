Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: "users/sessions" }

  root 'tests#index'

  resources :gists, only: %i[index create]

  resources :badges, only: :index

  resources :feedback, only: %i[index create]

  resources :tests, only: :index  do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :gists, only: %i[index destroy]
    resources :badges
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
