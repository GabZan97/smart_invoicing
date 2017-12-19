class AddIdsToHours < ActiveRecord::Migration[5.1]
  def up
    add_column :hours, :user_id, :integer
    add_column :hours, :client_id, :integer
  end
  def down
    remove_column :hours, :user_id
    remove_column :hours, :client_id
  end
end
