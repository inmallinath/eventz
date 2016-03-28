class AddStripeFieldsToUserEvents < ActiveRecord::Migration
  def change
    add_column :user_events, :stripe_txn_id, :string
    add_column :user_events, :stripe_customer_id, :string
    add_column :user_events, :stripe_last_4, :string
    add_column :user_events, :stripe_card_expiry, :string
  end
end
