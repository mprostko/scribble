class Round < ApplicationRecord
  belongs_to :player
  belongs_to :game
  has_many :scores

  scope :by_ready,    -> { where(status: :ready) }
  scope :by_playing,  -> { where(status: :playing) }
  scope :by_finished, -> { where(status: :finished) }

  enum status: [:ready, :playing, :finished]

  delegate :draw_time, to: :game

  def timed_word
    time_percent = (Time.current - round_start) / draw_time
    word_length = word.size
    up_to = word_length * time_percent
    word[0..up_to].ljust(word_length, '_')
  end
end
