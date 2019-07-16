class CreateRound
  def initialize(game:)
    @game = game
  end

  def perform
    Round.create!(
      word:   sample_word,
      game:   @game,
      status: :ready
    )
  end

  private

  def sample_word
    Word.order('RANDOM()').first
  end
end