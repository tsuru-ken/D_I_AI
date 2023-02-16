class CreateCaseStudies < ActiveRecord::Migration[6.1]
  def change
    create_table :case_studies do |t|
      t.string :name
      t.text :content
      t.text :image
      t.references :partner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
