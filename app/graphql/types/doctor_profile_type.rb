module Types
  class DoctorProfileType < Types::BaseObject
    graphql_name "DoctorProfile"

    #implements GraphQL::Types::Relay::Node
    global_id_field :id
    
    field :id, ID, null: false
    field :gender, String, null: true
    #field :dob, GraphQL::Types::ISO8601Date, null: false
    field :years_of_experiance, Integer, null: true
    field :register_number, String, null: true
    field :slot_duration, Integer, null: true
    field :consultation_fee, Integer, null: true
  end
end
