class Building < ApplicationRecord

    has_many :batteries
    has_many :building_details
    belongs_to :customer
    belongs_to :address
    has_many :fact_interventions, :dependent => :delete_all

    def position
        #puts address.number_and_street
        #{address: address.number_and_street}
        [address.number_and_street ,address.city, address.postal_code, address.country].compact.join(", ")
    end

    # def customer
    #     customer.CompanyName
    # end
end
