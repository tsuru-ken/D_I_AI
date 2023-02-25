class AddNullConstraintToTitleInDocuments < ActiveRecord::Migration[6.1]
  def change
    change_column_null :documents, :title, false
  end
end
