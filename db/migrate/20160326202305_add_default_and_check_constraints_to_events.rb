class AddDefaultAndCheckConstraintsToEvents < ActiveRecord::Migration
  def change
    change_column_default :events, :paid, false
    change_column_default :events, :price, 0
    rename_column :events, :recurrring, :recurring
    execute "ALTER TABLE events ADD CONSTRAINT events_recurring CHECK (recurring IN ('NO','DAILY','WEEKLY','MONTHLY','YEARLY') )"
    change_column_default :events, :recurring, 'NO'
  end
end
