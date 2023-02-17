class CreatePartnerCostLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :partner_cost_labels do |t|
      t.references :partner, null: false, foreign_key: true
      t.references :cost, null: false, foreign_key: true

      t.timestamps
    end
  end
end
