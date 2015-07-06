Rails.application.routes.draw do
  root "users#new"
  resources :users do
    resources :questions
  end
  resource :sessions
end
