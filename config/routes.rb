Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  
  resources :users, only: [:edit, :show]
  resources :books, only: [:new, :index, :show]
  get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
