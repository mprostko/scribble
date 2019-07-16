class CreateRound
  def initialize(game:)
    @game = game
  end

  def perform
    Round.create!(
      word:   sample_word,
      game:   @game,
      status: :ready,
      player: sample_artist
    )
  end

  private

  def available_words
    #Word.order('RANDOM()').limit(5).pluck(:word)
    ['mleko', 'kot', 'komputer']
  end

  def sample_word
    available_words.sample.downcase
  end

  def available_artists
    # Rewrite to normal SQL to select users with least rounds as creators
    @game.players
  end

  def sample_artist
    available_artists.sample
  end
end