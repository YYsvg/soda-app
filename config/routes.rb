Rails.application.routes.draw do
  get 'outcome_category/index'
  get 'outcome_category/new'
  get 'outcome_category/edit'
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }

  root :to =>  "homes#index"
  resources :incomes
  resources :outcomes
  resources :income_categories
  resources :outcome_categories

end
