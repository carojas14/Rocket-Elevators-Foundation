class Employee < ApplicationRecord
    # has_one :battery
    # belongs_to :user, dependent: :destroy
    has_many :factInterventions

end
