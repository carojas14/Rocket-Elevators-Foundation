# frozen_string_literal: true

module Types
  class BuildingType < Types::BaseObject
    field :id, ID, null: false
    field :customer_id, Integer
    field :address_id, Integer
    field :addressBuilding, String
    field :FullNameBuildingAdmin, String
    field :EmailAdminBuilding, String
    field :PhoneNumberBuildingAdmin, String
    field :FullNameTechContact, String
    field :TechContactEmail, String
    field :TechContactPhone, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :customer, Types::CustomerType, null:true
    field :interventions, [Types::FactInterventionType], null: false
    field :address, Types::AddressType, null:true

    def customer
      Customer.where(id: object.customer_id).first
    end

    ###  join Factintervention and get one only item
    def interventions
      FactIntervention.where(building_id: object.id)
    end

    ###  join address and get one only item
    def address
    Address.where(id: object.address_id).first
    end
  end
end
