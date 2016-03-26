class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.boolean :paid
      t.decimal :price
      t.string :recurrring
      t.datetime :date
      t.datetime :start
      t.datetime :end
      t.integer :day_of_week
      t.text :event_data
      t.references :address, index: true, foreign_key: true
      t.references :event_category, index: true, foreign_key: true
      t.references :unit, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
