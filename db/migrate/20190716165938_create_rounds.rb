class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.integer :status
      t.references :word, foreign_key: true
      t.references :artist, foreign_key: true # this is the player
      t.timestamp :round_start
      t.timestamp :round_end

      t.timestamps
    end
  end
end
