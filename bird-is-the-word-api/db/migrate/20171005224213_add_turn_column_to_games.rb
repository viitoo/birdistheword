class AddTurnColumnToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :turn, :integer, :default => 1
  end
end
