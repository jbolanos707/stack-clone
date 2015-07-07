Rails.application.routes.draw do
  root "users#new"
  resources :users do
    resources :questions do
      resources :answers
    end
  end
  resource :sessions
end
