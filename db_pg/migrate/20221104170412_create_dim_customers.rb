class CreateDimCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_customers do |t|
      t.datetime :creation_date, null: false
      t.string :compagny_name, null: false
      t.string :full_name_contact, null: false
      t.string :email, null: false
      t.integer :nb_elevator, null: false
      t.string :city, null: false

    end
  end
end
