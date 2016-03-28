class CreateOrganizationUnits < ActiveRecord::Migration
  def change
    create_table :organization_units do |t|
      t.references :organization, index: true, foreign_key: true
      t.references :unit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
