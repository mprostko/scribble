class Game < ApplicationRecord
  has_many :players
  has_many :rounds
  has_many :scores, through: :rounds

  enum status: [:lobby, :playing, :finished]

  def current_round
    rounds.by_playing.first
  end
end
