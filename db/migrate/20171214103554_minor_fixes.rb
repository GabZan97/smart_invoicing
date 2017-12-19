class MinorFixes < ActiveRecord::Migration[5.1]
  def change
    remove_column :hours, :is_fatturata
    remove_column :clients, :street_name
    remove_column :clients, :postal_code
    remove_column :clients, :street_number
    remove_column :clients, :city
    remove_column :clients, :state
    remove_column :users, :street_name
    remove_column :users, :postal_code
    remove_column :users, :street_number
    remove_column :users, :city
    remove_column :users, :state
  end
end
