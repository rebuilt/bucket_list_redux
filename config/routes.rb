Rails.application.routes.draw do
  root to: 'home#index'

  get 'home/index'

  get 'styles/atoms'

  get 'styleguide', to: 'styles#atoms'

  get 'styles/molecules'

  get 'styles/organisms'

resources :ideas

  get 'account/ideas'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
