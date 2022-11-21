json.extract! employee, :id, :lastName, :firstName, :title, :created_at, :updated_at
json.url employee_url(employee, format: :json)
