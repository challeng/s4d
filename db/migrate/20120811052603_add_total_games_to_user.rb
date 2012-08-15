class AddTotalGamesToUser < ActiveRecord::Migration
  def change
    add_column :users, :total_games, :string
  end
end
