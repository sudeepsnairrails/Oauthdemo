class AddTokenAuthToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :authentication_token, :text
    add_column :users, :authentication_token_created_at, :datetime

    add_index :users, :authentication_token, unique: true, :length => { :authentication_token => 5 }
  end
end
