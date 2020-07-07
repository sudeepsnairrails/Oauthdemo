module Types
  class PatientProfileType < Types::BaseObject
    graphql_name "PatientProfile"

    #implements GraphQL::Types::Relay::Node
    global_id_field :id
    
    field :id, ID, null: false
    field :gender, String, null: true
    field :dob, GraphQL::Types::ISO8601Date, null: false
    field :height, Integer, null: true
    field :weight, Integer, null: true
    
  end
end
