class AddDefaultAndCheckConstraintsToUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :admin, false
    execute "ALTER TABLE users ADD CONSTRAINT users_role CHECK (role IN ('User', 'Host', 'Speaker') )"
  end
end
