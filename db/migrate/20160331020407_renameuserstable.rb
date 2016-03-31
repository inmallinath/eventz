class Renameuserstable < ActiveRecord::Migration
  def change
    rename_table :users, :oldusers
  end
end
