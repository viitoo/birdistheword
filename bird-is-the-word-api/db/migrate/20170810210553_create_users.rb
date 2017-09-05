class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :score
      t.text :rack, array: true, default: []
      t.integer :player_1_id
      t.integer :player_2_id
      t.timestamps
    end
  end
end
