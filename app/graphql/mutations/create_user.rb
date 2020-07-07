module Mutations
  class CreateUser < BaseMutation
    #authorize_user
    # TODO: define return fields
     field :user, Types::UserType, null: true
     field :errors, [String], null: true

    # TODO: define arguments
     argument :name, String, required: true
     argument :email, String, required: true
     argument :password, String, required: true
    # TODO: define resolve method
     def resolve(name:, email:, password:)
      user = User.new(name: name, email: email, password: password)
       if user.save
        {
        user: user,
        errors: []
        }
      else{
        user: nil,
        errors: user.errors.full_messages
      }
     end
  end
end
end
