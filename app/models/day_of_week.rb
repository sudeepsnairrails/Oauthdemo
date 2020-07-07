class DayOfWeek < ApplicationRecord
    has_many :doctor_week_plans
    has_many :slots
end
