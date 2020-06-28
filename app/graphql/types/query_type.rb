module Types
  class QueryType < Types::BaseObject
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end

    field :post, Types::PostType, null: false do
      argument :id, ID, required: true
    end
    def post(id:)
      Post.find(id)
    end

    field :user_by_name, Types::UserType, null: false do
      argument :name, String, required: true
    end

    def user_by_name(name:)
      User.find_by(name: name)
    end

    field :all_users, [Types::UserType], null: false 

    def all_users
      User.all
    end

    
    

  end
end
