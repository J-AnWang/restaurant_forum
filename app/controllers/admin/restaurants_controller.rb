class Admin::RestaurantsController < ApplicationController
  # 先請使用者登入，不然直接判斷admin程式會掛掉
  before_action :authenticate_user!
  #這使用來判斷使同者是管理員還是一般使用者
  before_action :authenticate_admin

  def index
    @restaurants = Restaurant.all
  end

  def new
    # Restaurant.new 是用來產生一個 Restaurant instance 來給view使用
    @restaurant = Restaurant.new
  end

  def create
    # Restaurant.new 是用來產生一個 Restaurant instance 來取資料的
    # restaurant_params 是一個strong_params的機制，為了保護資料庫
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[notice] = "restaurant was successfully created"
      redirect_to admin_restaurants_path
    else
      #因為 flash 要跳頁才有作用，所以 flash 一般不會搭配 render，
      #因為 render 是沒有跳頁的，而是把 view 再顯示一次。所以這裡使用flash.now的用法
      flash.now[alert] = "restaurant was failed to created"
      # render :new 其實就是 render 一個 new template
      # render template: :new 簡化成 render :new
      # 如果是不同的controller可以寫成 "controllers/action"
      render :new
    end
  end

  private
  # params.require().permit(）
  # params 是 request裡的各種資訊之一，包含用戶所有傳進來的參數Hash
  # require(:object_name) 是取出 restaurant 這 table 的資料
  # permit 只允許指定資料放入model
  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :address, :opening_hours, :description)
  end
end
