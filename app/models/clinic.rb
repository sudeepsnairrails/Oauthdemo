class Clinic < ApplicationRecord
    has_and_belongs_to_many :doctor_profiles
    belongs_to :address
end
