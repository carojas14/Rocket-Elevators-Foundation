class CreateFactContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_contacts do |t|
      t.integer :contact_id, null: false
      t.datetime :creation_date, null: false
      t.string :compagny_name, null: false
      t.string :email, null: false
      t.string :name_project, null: false
    end
  end
end

