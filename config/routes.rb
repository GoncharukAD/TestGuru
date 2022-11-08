Rails.application.routes.draw do

  get :signup, to: 'users#new'

  resources :users, only: :create
  resources :tests  do
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
end
