Rails.application.routes.draw do

  resources :exhibitions, only: [:new] do
  end

  root 'items#index'

end
