Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'home#index'

  get 'home/index'

  get 'styleguide', to: 'styles#atoms'
  get 'styles/atoms'
  get 'styles/molecules'
  get 'styles/organisms'

  get 'account/ideas'

  resources :users do
    resources :goals
  end

  resources :ideas do
    resources :comments
  end

  resources :sessions, only: %i[new create destroy]

  get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'

  get 'account', to: 'account#edit'
  patch 'account', to: 'account#update'
  get 'account/goals'
end
