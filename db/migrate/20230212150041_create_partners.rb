class CreatePartners < ActiveRecord::Migration[6.1]
  def change
    create_table :partners do |t|
      t.string :name , null: false , limit: 30
      t.text :address , null: false , limit: 255
      t.text :url , null: false
      t.string :established , null: false
      t.text :service
      t.string :engineer
      t.bigint :provision
      t.text :product
      t.text :case

      t.timestamps
    end
  end
end
