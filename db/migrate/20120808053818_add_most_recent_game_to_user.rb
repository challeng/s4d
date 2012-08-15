class AddMostRecentGameToUser < ActiveRecord::Migration
  def change
    add_column :users, :most_recent_game, :string
  end
end
