class ChangeIndex < ActiveRecord::Migration[5.1]
  def change
    remove_index :users, :password_digest
    add_index :users, :username, unique: true
  end
end
