Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }

  namespace :admin do
    devise_scope :user do
      get 'login', to: 'sessions#new'
      post 'login', to: 'sessions#create'
      delete 'logout', to: 'sessions#destroy'
      get 'sign_up', to: 'registrations#new'
    end
    resources :dashboard, only: [:index]
    root to: 'dashboard#index'
  end

  root :to =>  "homes#index"
  resources :incomes
  resources :outcomes
  resources :income_categories
  resources :outcome_categories
  resources :wants

end
