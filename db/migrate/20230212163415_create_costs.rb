class CreateCosts < ActiveRecord::Migration[6.1]
  def change
    create_table :costs do |t|
      t.string :breakdown, null: false

      t.timestamps
    end
  end
end
