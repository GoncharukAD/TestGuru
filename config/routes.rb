Rails.application.routes.draw do

  resources :tests  do
    resources :questions, shallow: true, except: :index do
      resources :answer, shallow: true
    end  
  end  
end
