class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :api_key
      t.string :token
      t.string :secret
      t.text :raw_data
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
