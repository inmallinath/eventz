class AddForeignKeyOnAddresses < ActiveRecord::Migration
  def change
     add_reference :addresses, :event, index: true, foreign_key: true
  end
end
