class Renamedatecolumninevents < ActiveRecord::Migration
  def change
    rename_column :events, :date, :event_on
  end
end
