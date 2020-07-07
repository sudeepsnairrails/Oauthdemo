class RenameUserTypeToUserCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :user_type_id, :user_category_id
  end
end
