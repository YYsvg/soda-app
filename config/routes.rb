Rails.application.routes.draw do

  devise_for :users, controllers: {
    # LINEログインできる
    omniauth_callbacks: "omniauth_callbacks"
  }

  # 管理者ログインできる
  namespace :admin do
    devise_scope :user do
      get 'login',      to:    'sessions#new'
      post 'login',     to:    'sessions#create'
      delete 'logout',  to:    'sessions#destroy'
      get 'sign_up',    to:    'registrations#new'
    end
    resources :dashboard, only: [:index]
    root to: 'dashboard#index'
  end

  resources :users, only:[:show, :edit, :update] do
    collection do
      get "mypage",       :to     => "users#mypage"
      get "mypage/edit",  :to     => "users#edit#mypage"
      get "mypage/month", :to     => "users#month"
      put "mypage",       :to     => "users#update#mypage"
    end
  end


  devise_scope :user do
    root :to => "devise/sessions#new"
  end

  get 'homes', to: 'homes#index'

  resources :incomes
  resources :outcomes
  resources :income_categories
  resources :outcome_categories
  resources :wants

end
