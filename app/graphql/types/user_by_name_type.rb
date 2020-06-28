module Types
  class UserByNameType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: true

    field :posts, [Types::PostType], null: true

    field :posts_count, Integer, null: true
    field :first_post, PostType, null: true

    def posts_count
      object.posts.size
    end

    def first_post
      object.posts.first
    end

  end
end
