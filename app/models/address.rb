class Address < ApplicationRecord
    has_one :building
    geocoded_by :address
    after_validation :geocode

    def address 
        [number_and_street, city, postal_code, country].compact.join(", ")
    end
end
