class CreateServiceContents < ActiveRecord::Migration[6.1]
  def change
    create_table :service_contents do |t|
      t.string :division , null: false

      t.timestamps
    end
  end
end
