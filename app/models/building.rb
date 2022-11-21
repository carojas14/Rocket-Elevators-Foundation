class Building < ApplicationRecord

    # belongs_to :customer, class_name: "Customer", foreign_key: "customer_id"
    # belongs_to :adress, class_name: "Adress", foreign_key: "adress_id"
    # has_one :building_detail, class_name: "Building_detail", foreign_key: "building_id"
    # has_one :battery, class_name: "Battery", foreign_key: "building_id"
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
