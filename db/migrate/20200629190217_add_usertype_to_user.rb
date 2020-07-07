class AddUsertypeToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :user_category, foreign_key: true
  end
end
