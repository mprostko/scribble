class Round < ApplicationRecord
  belongs_to :word
  has_one :artist, class_name: 'Player'

  scope by_ready:    -> { where(status: :ready) }
  scope by_playing:  -> { where(status: :playing) }
  scope by_finished: -> { where(status: :finished) }

  enum status: [:ready, :playing, :finished]
end
