class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :uuid
      t.integer :status
      t.integer :max_rounds
      t.integer :draw_time

      t.timestamps
    end
  end
end
