# frozen_string_literal: true

module Types
  class BuildingDetailType < Types::BaseObject
    field :id, ID, null: false
    field :building_id, Integer
    field :information_key, String
    field :value, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
