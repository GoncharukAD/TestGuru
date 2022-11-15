Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :log_in, sign_out: :log_out }

  root 'tests#index'

  resources :tests, only: :index  do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member

  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests
  end
end
