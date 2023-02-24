class Admin::SessionsController < Devise::SessionsController
  def destroy
    super
  end
end