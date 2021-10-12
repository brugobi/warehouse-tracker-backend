class AddIndexToCode < ActiveRecord::Migration[5.2]
  def change
    add_index :items, :code, unique: true
  end
end
