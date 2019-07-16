class NextRound
  def initialize(game: game)
    @game = game
  end

  def perform
    current_round = @game.current_round
    current_round.finished!

    next_artist = (@game.players - [current_round.artist]).sample

    next_round = game.rounds.by_ready.sample
    next_round.update!(
      status: :playing,
      artist: next_artist
    )
  end
end