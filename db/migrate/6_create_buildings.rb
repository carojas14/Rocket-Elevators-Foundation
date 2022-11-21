class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.bigint :customer_id
      t.bigint :address_id
      t.string :addressBuilding
      t.string :FullNameBuildingAdmin
      t.string :EmailAdminBuilding
      t.string :PhoneNumberBuildingAdmin
      t.string :FullNameTechContact
      t.string :TechContactEmail
      t.string :TechContactPhone
      t.timestamps
    end
    add_foreign_key :buildings, :addresses
    add_foreign_key :buildings, :customers
  end
end