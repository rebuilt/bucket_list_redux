Rails.application.routes.draw do
  root to: 'home#index'

  get 'home/index'

  get 'styles/atoms'

  get 'styleguide', to: 'styles#atoms'

  get 'styles/molecules'

  get 'styles/organisms'

  get 'ideas', to: 'ideas#index'

  get 'ideas/new'

  get 'ideas/:id/edit', to: 'ideas#edit', as: 'edit_idea'

  get 'ideas/:id', to: 'ideas#show', as: 'show_idea'

  patch 'ideas/:id', to: 'ideas#update', as: 'idea'

  post 'ideas/create'


  get 'account/ideas'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
