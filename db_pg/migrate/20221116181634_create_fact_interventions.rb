class CreateFactInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_interventions do |t|
      t.integer :employee_id, null: false
      t.integer :building_id, null: false
      t.integer :battery_id, null: false
      t.integer :column_id, null: true
      t.integer :elevator_id, null: true
      t.datetime :start_intervention, null: false
      t.datetime :end_intervention, null: true
      t.string :result, null: false
      t.text :report, null: true
      t.string :status, null: true
    end
  end
end
