class AddUsernametoUsers < ActiveRecord::Migration
  def up
    add_column :users, :username, :string, null: false, default: ""
     end

  def down
    remove_column :users, :username
     end
end
