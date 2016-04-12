class AddDefaultToCapacityUnits < ActiveRecord::Migration
  def change
    change_column_default :units, :capacity, 0
  end
end
