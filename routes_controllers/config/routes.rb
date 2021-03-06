Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'users/:id', to: 'users#show', as: 'users'
  # get 'users', to: 'users#index', as: 'users_all'
  # post 'users', to: 'users#create', as: 'create_user'
  # get 'users/new', to: 'users#new', as: 'user_new'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # patch 'users/:id', to: 'users#update', as: 'patch_user'
  # put 'users/:id', to: 'users#update', as: 'put_user'
  # delete 'users/:id', to: 'users#destroy', as: 'destroy_user'
  resources :users, only: [:index, :show, :update, :create, :destroy]
  resources :artworks, only: [:show, :update, :create, :destroy]
  resources :users do 
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end
  resources :artwork_shares, only: [:create, :destroy] 
  resources :comments, only: [:create, :destroy, :index]
  resources :artworks do 
    resources :comments, only: [:index]
  end


  # resources :users
end
