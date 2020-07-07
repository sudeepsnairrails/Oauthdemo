module Types
  class UserCategoryType < Types::BaseObject
    graphql_name "UserCategoryType"

    global_id_field :id
    
    field :id, ID, null: false
    field :category, String, null: true
  end
end
