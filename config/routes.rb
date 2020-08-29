Rails.application.routes.draw do

  resources :exhibitions, only: [:new] do
  end

  devise_for :users

  root 'items#index'

end