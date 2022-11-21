class CreateFactElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_elevators do |t|
      t.integer :serial_number, null: false
      t.datetime :date_commissioning, null: false
      t.bigint :building_id, null: false
      t.bigint :customer_id, null: false
      t.string :city, null: false

    end
  end
end
