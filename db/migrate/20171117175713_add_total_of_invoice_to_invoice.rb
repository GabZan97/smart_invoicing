class AddTotalOfInvoiceToInvoice < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :total_amount, :float
  end
end
