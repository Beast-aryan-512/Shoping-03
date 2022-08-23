Rails.application.routes.draw do
  get 'users/index'
  root "users#index"
  resources :products
  devise_for :users
  post "checkout/create", to: "checkout#create"
  get "checkout/success", to: "checkout#success"
  get "checkout/failure", to: "checkout#failure"
  # resources :webhooks, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
