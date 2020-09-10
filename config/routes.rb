Rails.application.routes.draw do
  resources :exhibitions, only: [:new] do
  end

  devise_for :users

  root 'items#index'
  get 'users/index'
  
  get "exhibitions/confirm"
  
  devise_scope :users do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"   
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end