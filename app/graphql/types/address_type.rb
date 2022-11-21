# frozen_string_literal: true

module Types
  class AddressType < Types::BaseObject

    field :interventions, [Types::FactInterventionType], null: false

    field :id, ID, null: false
    field :type_address, String, null: false
    field :status, String, null: false
    field :entity, String, null: false
    field :number_and_street, String, null: false
    field :suit_or_apartment, String
    field :city, String, null: false
    field :postal_code, String, null: false
    field :country, String, null: false
    field :notes, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false


    def interventions
      FactIntervention.where(building_id: object.id)
    end
  end
end
