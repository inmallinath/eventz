class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :code
      t.string :description
      t.integer :capacity
      t.references :unit_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
