module Types
  class UserType < Types::BaseObject
    graphql_name "User"

    implements GraphQL::Types::Relay::Node
    global_id_field :id
    
    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :middle_name, String, null: true
    field :email, String, null: true 
    field :phone_number, String, null: false
    field :active, Boolean, null: true
    field :created_at, String, null: true

    field :full_name, String, null: false
    field :patient_profiles, [Types::PatientProfileType], null: true
    field :doctor_profiles, [Types::DoctorProfileType], null: true
    field :posts, [Types::PostType], null: true
    field :user_category, Types::UserCategoryType, null: true

    field :authentication_token, String, null: false

     
    def full_name
      full_name = object.first_name + object.middle_name + object.last_name
    end

    def user_category
      category = object.user_category
    end

  end
end
