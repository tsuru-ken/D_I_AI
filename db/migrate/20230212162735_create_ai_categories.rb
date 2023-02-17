class CreateAiCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :ai_categories do |t|
      t.string :genre, null: false

      t.timestamps
    end
  end
end
