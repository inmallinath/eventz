class Renameproviderstable < ActiveRecord::Migration
  def change
    rename_table :providers, :oldproviders
  end
end
