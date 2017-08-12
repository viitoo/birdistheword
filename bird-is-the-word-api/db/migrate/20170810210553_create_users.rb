class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :games_played
      t.integer :games_won
      t.integer :game_id
      t.integer :score
      t.text :rack, array: true, default: []
      t.timestamps
    end
  end
end
