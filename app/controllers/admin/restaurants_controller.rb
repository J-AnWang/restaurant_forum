class Admin::RestaurantsController < ApplicationController
  # 先請使用者登入，不然直接判斷admin程式會掛掉
  before_action :authenticate_user!
  #這使用來判斷使同者是管理員還是一般使用者
  before_action :authenticate_admin

  def index
    @restaurants = Restaurant.all
  end
end
