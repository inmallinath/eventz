class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :email
      t.string :mobile
      t.string :password_digest
      t.string :role
      t.boolean :admin
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.string :auth_token
      t.references :address, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
