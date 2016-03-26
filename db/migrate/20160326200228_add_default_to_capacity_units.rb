class AddDefaultToCapacityUnits < ActiveRecord::Migration
  def change
    change_column :units, :capacity, default: 0
  end
end
