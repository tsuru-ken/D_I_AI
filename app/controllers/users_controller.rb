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
    return if current_user.admin? || params[:id] == 'sign_out'
    redirect_to root_path, alert: "他のユーザーページにはアクセスできません。"
  end
end

