class NextRound
  def initialize(game: game)
    @game = game
  end

  def perform
    current_round.update(
      status: :finished,
      round_end: current_time
    ) if current_round


    if(available_rounds.count < 1)
      @game.finished!
    else
      available_rounds.sample.update!(
        round_start: current_time,
        status: :playing,
        player: available_artists.sample
      )
    end
  end

  private

  def available_rounds
    @available_rounds ||= @game.rounds.by_ready
  end

  def available_artists
    # Rewrite to normal SQL to select users with least rounds as creators
    if current_round
      @game.players - [current_round.player]
    else
      @game.players
    end
  end

  def current_time
    @current_time ||= Time.current
  end

  def current_round
    @current_round ||= @game.current_round
  end
end