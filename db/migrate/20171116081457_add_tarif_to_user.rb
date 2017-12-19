class AddTarifToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tarif, :float
  end
end
