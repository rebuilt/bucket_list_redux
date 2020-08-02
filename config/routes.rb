Rails.application.routes.draw do
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

end
