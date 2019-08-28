class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    find_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def find_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:photo, :first_name, :last_name, :email, :location, :bio)
  end



end
