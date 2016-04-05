class RemoveForeignKeyOnEvent < ActiveRecord::Migration
  def change
    remove_foreign_key :events, column: :address_id
    remove_column :events, :address_id
    # remove_reference :events, :address
    # add_reference :addresses, :events, index: true, foreign_key: true
  end
end
