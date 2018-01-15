class Admin::BaseController < ApplicationController
  # 驗證該 User 身份是否為網站管理員
  before_action :authenticate_admin

  private
  
  # 此 method 被admin：：restaurantscontroller 呼叫來判斷是否為admin
  # 而當中的 admin？ 是從user.rb 呼叫過來的
  def authenticate_admin
    unless current_user.admin?
      flash[:alert] =  "NOT ALLOW!"
      redirect_to root_path
    end
  end
end
