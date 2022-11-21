module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me

    ##### Address ######

    field :address,
    [Types::AddressType],
    null: false,
    description: "Return a list of addresses"

    def address
      Address.all
    end


    ##### Intervention ######

    field :interventions, [Types::FactInterventionType], null: false do
      description 'Find all interventions'
    end

    field :intervention, Types::FactInterventionType, null: false do
      description 'Find a author by ID'
      argument :id, ID, required: true
    end

    def interventions
      FactIntervention.all
    end

    def intervention(id:)
      FactIntervention.find(id)
    end


    ##### Customer ######

    field :customers,
    [CustomerType],
    null: false,
    description: "Return a list of customers"


    field :customer, Types::CustomerType, null: false do
      argument :id, ID, required: true
    end

    def customers
      Customer.all
    end

    def customer(id:)
      Customer.find(id)
    end


    ##### Employee ######

    field :employee, Types::EmployeeType, null: false do
      argument :id, Integer, required: false
    end

    field :employees, [EmployeeType], null: false,
    description: "Return a list of employees"

    def employee(id:)
      Employee.find(id)
    end

    def employees
      Employee.all
    end


    ##### Building ######

    field :buildings, [Types::BuildingType], null: false

    def buildings
      Building.all
    end


    field :building, Types::BuildingType, null: false do
      argument :id, ID, required: true
    end

    def building(id:)
      Building.find(id)
    end

  end
end
