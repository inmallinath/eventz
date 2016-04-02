class AddAddressReferencesToIdentities < ActiveRecord::Migration
  def change
    add_reference :identities, :address, index: true, foreign_key: true
  end
end
