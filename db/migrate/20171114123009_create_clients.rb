class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :codice_fiscale
      t.string :email
      t.integer :partita_iva

      t.timestamps
    end
  end
end
