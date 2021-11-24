class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :money_type)
  end

  def correct_user
    user = User.find(params[:id])
    redirect_to user_path(current_user) unless user == current_user
  end
end
