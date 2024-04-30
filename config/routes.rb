Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }

  root :to =>  "homes#index"
  resources :incomes
  resources :outcomes
  resources :income_categories
  resources :outcome_categories
  resources :wants


end
