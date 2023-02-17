class CreatePartnerAiCategoryLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :partner_ai_category_labels do |t|
      t.references :partner, null: false, foreign_key: true
      t.references :ai_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
