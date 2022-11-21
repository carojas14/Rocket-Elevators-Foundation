class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|
      t.bigint :building_id
      # t.references :building, foreing_key: true
      t.string :information_key
      t.string :value
      t.timestamps
    end
    add_foreign_key :building_details, :buildings
  end
end