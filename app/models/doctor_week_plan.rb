class DoctorWeekPlan < ApplicationRecord
    belongs_to :day_of_week
    belongs_to :doctor_profile
end
