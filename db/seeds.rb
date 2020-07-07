require "faker"

###Seeding User type table
UserType.create(user_type: "doctor")
UserType.create(user_type: "patient")

###seeding specialisation table
Specialisation.create(specialisation: "General medicine", active: true )
Specialisation.create(specialisation: "ENT", active: true)

##Creating Patints
5.times do
  user = User.create(email: Faker::Internet.email, password: "123456", first_name: Faker::Name.name, last_name: Faker::Name.name, middle_name: Faker::Name.name, phone_number: Faker::PhoneNumber.phone_number, active: true)
  addr = Address.create(address_line_1: Faker::Address.street_suffix, address_line_2: Faker::Address.street_suffix, city: Faker::Address.city, state: Faker::Address.state, country: Faker::Address.country, pin: Faker::Address.zip)
  user.user_type = UserType.last
  user.save
  p = user.patient_profiles.create(gender: Faker::Gender.binary_type, blood_group: "O+", dob: Faker::Date.birthday, height: 178, weight: 80, )
  p.address = addr
  p.save
end

###Create doctors
3.times do
user = User.create(email: Faker::Internet.email, password: "123456", first_name: Faker::Name.name, last_name: Faker::Name.name, middle_name: Faker::Name.name, phone_number: Faker::PhoneNumber.phone_number, active: true)
addr = Address.create(address_line_1: Faker::Address.street_suffix, address_line_2: Faker::Address.street_suffix, city: Faker::Address.city, state: Faker::Address.state, country: Faker::Address.country, pin: Faker::Address.zip)
user.user_type = UserType.first
user.save
spec = Specialisation.find(1)
  d = user.doctor_profiles.create(gender: Faker::Gender.binary_type, years_of_experiance: Faker::Number.number(digits:2), register_number: Faker::Number.number(digits:4), consultation_fee: Faker::Number.number(digits:3), slot_duration: Faker::Number.number(digits:2) )
  d.specialisation = spec
  d.address= addr
  d.save
end

#creating Clinics
3.times do
  clinic = Clinic.create(name: Faker::Name.name, active: true)
  addr = Address.create(address_line_1: Faker::Address.street_suffix, address_line_2: Faker::Address.city, state: Faker::Address.state, country: Faker::Address.country, pin: Faker::Address.zip)
  clinic.address = addr
  clinic.save
end




