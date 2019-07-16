class Game < ApplicationRecord
  has_many :players
  has_many :rounds
  has_many :scores, through: :rounds

  enum status: [:lobby, :playing, :finished]

  def current_round
    rounds.by_playing.first
  end

  def creator
    players.by_creator.first
  end

  def score
    # Rewrite to SQL
    user_score = players.each_with_object({}) { |x, object| 
      object[x] = 0
    }

    scores.each do |s|
      user_score[s.player] += s.score
    end

    user_score
  end
end
