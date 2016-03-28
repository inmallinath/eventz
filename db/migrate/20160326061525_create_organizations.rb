class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :code
      t.string :description
      t.string :url
      t.string :logo
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
