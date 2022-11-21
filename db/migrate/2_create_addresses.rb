class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string "type_address", null: false
      t.string "status", null: false
      t.string "entity", null: false
      t.string "number_and_street", null: false
      t.string "suit_or_apartment"
      t.string "city", null: false
      t.string "postal_code", null: false
      t.string "country", null: false
      t.text "notes"
      t.decimal "latitude", precision: 10, scale: 6
      t.decimal "longitude", precision: 10, scale: 6
      t.timestamps
    end
  end
end