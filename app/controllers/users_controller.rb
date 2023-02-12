class UsersController < ApplicationController
   before_action :admin_user?
  def show
  # binding.pry
    @user = User.find(params[:id])
    # @user = User.find_by(id: params[:id])
  end

  def index
    @user = User.find_by(id: params[:id])
  end
end
private

  def admin_user?
    return if current_user.admin? || User.find(params[:id]) == current_user
    redirect_to root_path, alert: "他のユーザーページにはアクセスできません。"
  end


