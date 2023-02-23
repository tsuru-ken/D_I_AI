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
end

def admin_user?
  if current_user && current_user.admin?
    true
  else
    redirect_to(root_url)
  end
end