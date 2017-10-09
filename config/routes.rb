Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'home#index'

  resources :foundations, only: [:new, :create, :show] do
    member do
      resources :pledges, only: [:new, :create, :cancel]
    end
  end

  resources :pledges, only: [:show]
end
