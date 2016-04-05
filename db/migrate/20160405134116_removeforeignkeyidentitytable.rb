class Removeforeignkeyidentitytable < ActiveRecord::Migration
  def change
    remove_foreign_key :identities, column: :address_id
  end
end
