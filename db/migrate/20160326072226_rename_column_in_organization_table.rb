class RenameColumnInOrganizationTable < ActiveRecord::Migration
  def change
    rename_column(:organizations, :user_id, :representative_id)
  end
end
