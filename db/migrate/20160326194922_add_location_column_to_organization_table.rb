class AddLocationColumnToOrganizationTable < ActiveRecord::Migration
  def change
    add_column :organizations, :location, :string
  end
end
