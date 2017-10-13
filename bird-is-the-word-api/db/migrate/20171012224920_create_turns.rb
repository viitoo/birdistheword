class CreateTurns < ActiveRecord::Migration[5.0]
  def change
    create_table :turns do |t|
      t.string :played_word
      t.integer :points
      t.integer :game_player_id
      t.timestamps
    end
  end
end
