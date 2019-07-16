class CreateScore
  def initialize(player:, score: 100)
    @player = player
    @game = @player.game
    @score = score
  end

  def perform
    Score.create!(
      round: @game.current_round,
      player: @player,
      score: @score
    )
  end
end