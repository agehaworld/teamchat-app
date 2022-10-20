Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "teams#index"
  resources :users, only: [:edit, :update, :delete]
  resources :teams, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
end
