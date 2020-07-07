class DoctorProfile < ApplicationRecord
  belongs_to :user
  belongs_to :specialisation
  belongs_to :address
  has_and_belongs_to_many :clinics
  has_many :appointments
  has_many :doctor_leaves
  has_many :doctor_week_plans
  has_many :slots
end

