Rails.application.routes.draw do
  root to: 'users#index'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'users/:id/activate',to: 'users#activate', as: 'activate'

  resources :users, only: [:new, :create, :edit, :show, :update] do
    resources :accounts
  end

  resources :accounts, only: [:show] do
    resources :websites
  end

  resources :websites do
    resources :keywords
  end
end
