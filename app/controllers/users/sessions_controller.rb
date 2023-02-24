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

  private

  def guest_admin_user?
    if current_user && current_user.admin?
      true
    else
      redirect_to(root_url)
    end
  end

  def authenticate_user!
    if !guest_admin_user?
      super
    end
  end
end
