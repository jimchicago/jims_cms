class AddColumnsToAdminUser < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :first_name, :string, :limit => 25 
    add_column :admin_users, :last_name, :string, :limit => 50
    add_column :admin_users, :email, :string, :limit => 100, :default => "", :null => false
    add_column :admin_users, :username, :string, :limit => 40
  end
end
