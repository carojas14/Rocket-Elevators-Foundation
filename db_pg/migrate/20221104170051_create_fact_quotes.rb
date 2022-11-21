class CreateFactQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_quotes do |t|
      t.integer :quote_id, null: false
      t.datetime :creation_date, null: false
      t.string :company_name, null: false
      t.string :email, null: false
      t.integer :nb_elevator, null: false
    end
  end
end
