class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.bigint :user_id
      # t.bigint :address_id
      t.string "CustomerCreationDate", limit: 50, null: false
      t.string "CompanyName", limit: 50, null: false
      t.string "CompanyHeadquarterAdress"
      t.string "FullNameCompanyContact", limit: 50, null: false
      t.string "CompanyContactPhone", limit: 50, null: false
      t.string "EmailCompanyContact", limit: 50, null: false
      t.string "CompanyDescription", limit: 500, null: false
      t.string "FullNameServiceTechnicalAuth", limit: 50, null: false
      t.string "TechnicalAuthorityPhoneService", limit: 50, null: false
      t.string "TechnicalManagerEmailService", limit: 50, null: false
      t.timestamps
    end
    # add_foreign_key :customers, :addresses
    # add_foreign_key :customers, :users
  end
end
