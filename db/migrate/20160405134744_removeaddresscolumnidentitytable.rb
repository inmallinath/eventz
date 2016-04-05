class Removeaddresscolumnidentitytable < ActiveRecord::Migration
  def change
    remove_column :identities, :address_id
  end
end
