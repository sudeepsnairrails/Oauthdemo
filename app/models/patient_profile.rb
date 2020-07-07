class PatientProfile < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :appointments
end
