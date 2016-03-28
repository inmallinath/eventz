class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :description
      t.string :zip
      t.float :latitude
      t.float :longitude
      t.references :city, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
