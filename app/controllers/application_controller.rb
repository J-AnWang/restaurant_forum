class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # 驗證請求進入後台的是否為已登入的 User
  before_action :authenticate_user!
  # 此 method 被admin：：restaurantscontroller 呼叫來判斷是否為admin
  # 而當中的 admin？ 是從user.rb 呼叫過來的
  def authenticate_admin
    unless current_user.admin?
      flash[:alert] =  "NOT ALLOW!"
      redirect_to root_path
    end
  end
end
