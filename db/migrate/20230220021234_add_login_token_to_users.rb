class AddLoginTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :login_token, :string
  end
end
