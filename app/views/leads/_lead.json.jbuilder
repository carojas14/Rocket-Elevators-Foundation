json.extract! lead, :id, :full_name_contact, :company_name, :email, :phone, :project_name, :project_description, :departement_in_charge, :message, :attached_file, :date_contact_request, :created_at, :updated_at
json.url lead_url(lead, format: :json)
