class AddAddressForeignKeyToUserTable < ActiveRecord::Migration
  def change
    # add_foreign_key :users, :addresses
    add_reference :addresses, :user, index: true, foreign_key: true
  end
end
