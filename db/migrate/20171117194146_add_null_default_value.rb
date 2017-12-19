class AddNullDefaultValue < ActiveRecord::Migration[5.1]
  def change
    add_column :hours, :invoice_id, :integer, :default => nil
    change_column :invoices, :total_amount, :float, :default => 0.0
  end
end
