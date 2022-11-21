class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      # keep the names as it is right now
      t.string "contactName", limit: 99, null: false
      t.string "contactBuisnessName", limit: 99, null: false
      t.string "contactEmail", limit: 99, null: false
      t.string "contactPhone", null: false
      t.string "projectName", limit: 99, null: false
      t.string "projectDescription"
      t.string "contactDepartement", limit: 99, null: false
      t.string "message"
      t.binary "contactAttachment"
      t.date "contactDate", null: false

      t.timestamps
    end
  end
end
