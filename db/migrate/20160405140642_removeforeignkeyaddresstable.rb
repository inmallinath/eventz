class Removeforeignkeyaddresstable < ActiveRecord::Migration
  def change
    remove_foreign_key :addresses, column: :user_id
    remove_column :addresses, :user_id
  end
end
