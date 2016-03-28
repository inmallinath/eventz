class RenameColumnInEventTable < ActiveRecord::Migration
  def change
    rename_column(:events, :user_id, :speaker_id)
  end
end
