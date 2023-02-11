class UsersController < ApplicationController
  
  def show
  # binding.pry
    @user = User.find(params[:id])
    # @user = User.find_by(id: params[:id])
  end
end
# private

  # def admin_user?
  #   return if current_user.admin? || User.find(params[:id]) == current_user
  #   redirect_to root_path, alert: "他のユーザーページにはアクセスできません。"
  # end


