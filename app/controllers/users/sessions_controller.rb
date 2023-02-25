class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path
  end

  def new_guest_admin
    user = User.guest_admin
    sign_in user
    redirect_to root_path
  end

  def destroy
    sign_out(resource_name)
    redirect_to root_path
  end

  

