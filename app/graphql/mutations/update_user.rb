module Mutations
  class UpdateUser < BaseMutation
    #authorize_user
    # TODO: define return fields
    field :user, Types::UserType, null: true
    field :errors, [String], null: true

   # TODO: define arguments
    argument :name, String, required: true
    argument :email, String, required: true
    argument :id, ID, required: true
   # TODO: define resolve method
    def resolve(id:, name:, email:)
     user = User.find(id)
      if user.update(name: name, email: email)
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
