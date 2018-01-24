class ChangeDefaultToRestaurant < ActiveRecord::Migration[5.1]
  def change
    change_column :restaurants, :favorites_count, :integer, default: 0, null: false
  end
end
