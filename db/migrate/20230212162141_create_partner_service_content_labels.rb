class CreatePartnerServiceContentLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :partner_service_content_labels do |t|
      t.references :partner, null: false, foreign_key: true
      t.references :service_content, null: false, foreign_key: true

      t.timestamps
    end
  end
end
