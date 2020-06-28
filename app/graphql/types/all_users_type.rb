module Types
    class allUsersType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: true
      field :email, String, null: true
      field :created_at, String, null: true
    end
  end