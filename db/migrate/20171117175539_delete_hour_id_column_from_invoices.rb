class DeleteHourIdColumnFromInvoices < ActiveRecord::Migration[5.1]
  def change
    remove_column :invoices, :hour_id
  end
end
