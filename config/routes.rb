Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
  }
  root 'top#index'

  resources :users, only: [:index, :show]
  resources :reactions, only: [:create] 
  resources :matching, only: [:index]
  resources :chat, only: [:create, :show]

  mount ActionCable.server => '/cable'
end
