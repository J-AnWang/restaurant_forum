Rails.application.routes.draw do
  devise_for :users

  resources :restaurants, only: [:index, :show]
  root "restaurants#index"

  # 使用namespace來把前台後台分開
  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
end
