class Customer < ApplicationRecord

    has_one :user
    has_many :buildings
    has_many :fact_interventions

end
