class GuessWord
  def initialize(player: player)
    @player = player
    @game = @player.game
  end

  def perform(word)
    word_guessed if @game.current_round.word == word
  end

  private

  def word_guessed
    CreateScore.new(player: @player, score: 100).perform
    NextRound.new(game: @game).perform
  end
end