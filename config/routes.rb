Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]


    collection do
      # 瀏覽所有餐廳的最新動態
      get :feeds

      # 瀏覽所有餐廳的top 10 排行榜
      get :ranking

    end

    # 瀏覽個別餐廳的 Dashboard
    member do
      get :dashboard

      # 收藏 / 取消收藏
      post :favorite
      post :unfavorite

      # 喜歡 / 取消喜歡
      post :like
      post :unlike
    end

  end
  resources :categories, only: :show
  root "restaurants#index"

  # 使用namespace來把前台後台分開
  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
end
