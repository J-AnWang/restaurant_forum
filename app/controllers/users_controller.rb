class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def show
    @commented_restaurant = @user.restaurants
    @commented_restaurant = @commented_restaurant.uniq
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
