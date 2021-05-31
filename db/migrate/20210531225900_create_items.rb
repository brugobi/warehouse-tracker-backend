class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :code
      t.string :name
      t.integer :ideal_quantity
      t.integer :current_quantity

      t.timestamps
    end
  end
end
