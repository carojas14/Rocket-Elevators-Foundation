class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.bigint :column_id
      t.integer :serial_nb
      t.string :model
      t.string :elevator_type
      t.string :elevator_status
      t.datetime :date_commissioning
      t.datetime :date_last_inspection
      t.string :certificate_inspection
      t.text :information
      t.text :notes
      t.timestamps
    end
  end
end
