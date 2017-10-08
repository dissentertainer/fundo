Rails.application.routes.draw do
  root 'home#index'

  resources :foundations, only: [:new, :create, :show]

end
