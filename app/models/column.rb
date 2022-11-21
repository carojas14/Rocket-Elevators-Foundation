class Column < ApplicationRecord

    # belongs_to :battery, class_name: "Battery", foreign_key: "battery_id"
    # has_many :elevators, class_name: "Elevator", foreign_key: "column_id"
    belongs_to :battery
    has_many :elevators

    def fromBattery
        Column.battery_id
    end
end
