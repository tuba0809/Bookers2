Rails.application.routes.draw do
  devise_for :users
  # For details on he DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get '/home/about', to: 'homes#about'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
 end
  resources :users, only: [:show, :edit, :update, :index]
end

