class UsersController < ApplicationController
  before_action :admin_user?, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.find_by(id: params[:id])
  end

  private

  
  def admin_user?
    if current_user.id == params[:id].to_i || current_user.admin?
      return
    else
      redirect_to root_path, alert: "他のユーザーページにはアクセスできません。"
    end
  end
end

