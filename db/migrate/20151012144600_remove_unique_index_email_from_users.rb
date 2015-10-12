class RemoveUniqueIndexEmailFromUsers < ActiveRecord::Migration
  def change
    remove_index :users, :email
    change_column_null :users, :email, true
  end
end
