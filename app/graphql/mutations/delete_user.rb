module Mutations
  class DeleteUser < BaseMutation
     # TODO: define return fields
     field :user, Types::UserType, null: true
     field :errors, [String], null: true
 
    # TODO: define arguments
     argument :id, ID, required: true
    # TODO: define resolve method
     def resolve(id:)
      user = User.find(id)
       if user.destroy
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
