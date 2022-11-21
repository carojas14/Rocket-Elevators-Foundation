# frozen_string_literal: true

module Types
  class CustomerType < Types::BaseObject
    field :address_id, Integer

    field :id, ID, null: false
    field :user_id, Integer
    field :CustomerCreationDate, String, null: false
    field :CompanyName, String, null: false
    field :CompanyHeadquarterAdress, String
    field :FullNameCompanyContact, String, null: false
    field :CompanyContactPhone, String, null: false
    field :EmailCompanyContact, String, null: false
    field :CompanyDescription, String, null: false
    field :FullNameServiceTechnicalAuth, String, null: false
    field :TechnicalAuthorityPhoneService, String, null: false
    field :TechnicalManagerEmailService, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
