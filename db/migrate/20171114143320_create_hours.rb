class CreateHours < ActiveRecord::Migration[5.1]
  def change
    create_table :hours do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.text :description

      t.timestamps
    end
  end
end
