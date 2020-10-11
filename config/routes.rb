Rails.application.routes.draw do

  resources :exhibitions do
    collection do
      get 'categories/get_category_children', to: 'exhibitions#get_category_children', defaults: { format: 'json' }
      get 'categories/get_category_grandchildren', to: 'exhibitions#get_category_grandchildren', defaults: { format: 'json' }
    end

    member do
      post 'pay'=>   'exhibitions#pay', as: 'pay'
    end

    resources :purchases, only: [:index] do
    end

  end

  devise_for :users

  root 'items#index'

  resources :users, only: [:index, :show, :edit, :update] do
  end

  get    'users/:id'   =>  'users#show'
  #devise_for :users, #{
  #   registrations: 'users/registrations',
  #   sessions:      'users/sessions'
  # }
  resources :categories, only: [:index] do
    member do
      get 'parent'
      get 'child'
      get 'grandchild'
    end
  end

  devise_scope :users do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  resources :cards, except: [:index, :edit, :update] do
  end

end