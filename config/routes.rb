Rails.application.routes.draw do
  get 'favorite/create'
  get 'favorite/destroy'
  root to: 'homes#top'
  

  devise_for :users, path: 'users'

  resources :users, only: [:edit, :show, :index, :update]
  resources :books, only: [:new, :index, :show, :create, :edit, :destroy, :update] do
    resource :favorite, only: [:create, :destroy]
  end
  get '/home/about' => 'homes#about', as: 'bookers_about'
end
