class FriendshipsController < ApplicationController
  def create
    # 會使用friending_id: params[:friending] 是因為build & new 必須傳入hash值做建立
    @user = User.find(params[:friending])
    @friendship = current_user.friendships.build(friending_id: params[:friending])
    if @friendship.save
      flash[:notice] = "Now, #{@user.name} is you new friend!"
    else
      flash[:alert] = "You had added it before."
    end
    redirect_back fallback_location: users_path
  end

  def destroy
    @user = User.find(params[:id])
    @friendship = current_user.friendships.where(friending_id: params[:id]).first
    @friendship.destroy
    flash[:alert] = "So sad! You canceled the friendship with #{@user.name}."
    redirect_back fallback_location: users_path
  end
end
