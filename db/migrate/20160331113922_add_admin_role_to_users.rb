class AddAdminRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :role, :string
    execute "ALTER TABLE users ADD CONSTRAINT users_role CHECK (role IN ('User', 'Host', 'Speaker') )"
  end
end
