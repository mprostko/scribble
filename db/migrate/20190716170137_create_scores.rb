class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.references :player, foreign_key: true
      t.references :round, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
