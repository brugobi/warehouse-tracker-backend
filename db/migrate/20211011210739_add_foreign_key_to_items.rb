class AddForeignKeyToItems < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :items, :users
  end
end
