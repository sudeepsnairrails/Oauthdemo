class Address < ApplicationRecord
    has_one :patient_profiles
    has_one :doctor_profiles
    has_one :clinics
end
