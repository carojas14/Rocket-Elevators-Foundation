json.extract! battery, :id, :building_id, :employee_id, :type, :status, :date_commissioning, :date_last_inspection, :certificate_operations, :information, :notes, :created_at, :updated_at
json.url battery_url(battery, format: :json)
