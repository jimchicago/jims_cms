class AddHashedPasswordField < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :hashed_password, :string, :limit => 40
  end
end
