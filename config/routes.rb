Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "restaurants#index"

  # 使用namespace來把前台後台分開
  namespace :admin do
    root "restaurants#index"
  end
end
