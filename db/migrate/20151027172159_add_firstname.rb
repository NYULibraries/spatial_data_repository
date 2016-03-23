class AddFirstname < ActiveRecord::Migration
  def change
	add_column :users, :firstname, :string, null: true
	add_column :users, :lastname, :string, null: true
  end
end
