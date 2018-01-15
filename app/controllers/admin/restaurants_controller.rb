class Admin::RestaurantsController < Admin::BaseController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.page(params[:page]).per(12)
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
      flash[:notice] = "restaurant was successfully created"
      redirect_to admin_restaurants_path
    else
      #因為 flash 要跳頁才有作用，所以 flash 一般不會搭配 render，
      #因為 render 是沒有跳頁的，而是把 view 再顯示一次。所以這裡使用flash.now的用法
      flash.now[:alert] = "restaurant was failed to created"
      # render :new 其實就是 render 一個 new template
      # render template: :new 簡化成 render :new
      # 如果是不同的controller可以寫成 "controllers/action"
      render :new
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = "Restaurant was successfully updated"
      redirect_to admin_restaurant_path(@restaurant)
    else
      flash.now[:alert] = "Restaurant was failed to update"
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    flash[:notice] = "restaurant was deleted"
    redirect_to admin_restaurants_path
  end

  private
  # params.require().permit(）
  # params 是 request裡的各種資訊之一，包含用戶所有傳進來的參數Hash
  # require(:object_name) 是取出 restaurant 這 table 的資料
  # permit 只允許指定資料放入model
  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :address, :opening_hours, :description, :image, :category_id)
  end
  # 用來縮減程式碼，所以將到資料庫查找資料的動作設成function，方便共同呼叫
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
