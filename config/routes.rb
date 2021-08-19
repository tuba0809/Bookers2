Rails.application.routes.draw do
  devise_for :users
  # For details on he DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :destroy] do
 end
  resources :users, only: [:show]
end

