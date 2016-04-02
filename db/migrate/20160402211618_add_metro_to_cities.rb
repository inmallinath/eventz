class AddMetroToCities < ActiveRecord::Migration
  def change
    add_column :cities, :metro, :boolean, default: false
  end
end
