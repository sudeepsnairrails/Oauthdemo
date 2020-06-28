module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: true 
    field :created_at, String, null: true

    field :posts, [Types::PostType], null: true

    field :posts_count, Integer, null: true
    field :first_post, PostType, null: true 
    field :post_titles, [String], null: false

    def posts_count
      if object.posts.size > 0
        return 222
      else
        return 888
      end
    end

    def first_post
      object.posts.first
    end

    def email
      object.email
    end
    def post_titles
      list = Array.new
      object.posts.each do |p|
        list.push(p.title)
      end
      
  
      return list
    end
  end
end
