class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.bigint :battery_id
      t.string :column_type
      t.integer :served_floors_nb
      t.string :status
      t.text :information
      t.text :notes
    end
    add_foreign_key :columns, :batteries
  end
end
