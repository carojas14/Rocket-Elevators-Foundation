class Customer < ApplicationRecord

    # has_one :user
    # belongs_to :address
    # has_one :building
    has_one :user
    has_many :buildings
    has_many :fact_interventions

end
