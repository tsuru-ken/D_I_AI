class AddUserRefToDocuments < ActiveRecord::Migration[6.1]
  def change
    add_reference :documents, :user, foreign_key: true
  end
end
