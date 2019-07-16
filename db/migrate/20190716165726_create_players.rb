class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :username
      t.string :uuid
      t.boolean :creator, default: false
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
