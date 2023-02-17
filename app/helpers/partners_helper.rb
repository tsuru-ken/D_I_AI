module PartnersHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_partners_path
    elsif action_name == 'edit'
      partner_path
    end
  end
end
