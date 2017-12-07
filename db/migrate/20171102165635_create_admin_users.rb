class CreateAdminUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :admin_users do |t|

      t.timestamps
    end
  end

  def down
    drop_table :admin_users
  end

end
