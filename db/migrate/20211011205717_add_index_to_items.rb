class AddIndexToItems < ActiveRecord::Migration[5.2]
  def change
    add_index :items, :user_id
  end
end
