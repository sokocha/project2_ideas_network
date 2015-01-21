class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  def show
  end





private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :bio, :avatar, :user_image)
  end
end

