json.extract! customer, :id, :CustomerCreationDate, :CompanyName, :CompanyHeadquarterAdress, :FullNameCompanyContact, :CompanyContactPhone, :EmailCompanyContact, :CompanyDescription, :FullNameServiceTechnicalAuth, :TechnicalAuthorityPhoneService, :TechnicalManagerEmailService, :created_at, :updated_at
json.url customer_url(customer, format: :json)
