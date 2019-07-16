class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.integer :status
      t.string :word
      t.references :player, foreign_key: true # this is the player
      t.references :game, foreign_key: true
      t.timestamp :round_start
      t.timestamp :round_end

      t.timestamps
    end
  end
end
