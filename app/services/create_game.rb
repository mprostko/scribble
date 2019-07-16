class CreateGame
  def initialize(player:, max_rounds: 3, draw_time: 60)
    @player     = player
    @max_rounds = max_rounds
    @draw_time  = draw_time
  end

  def perform
    game = Game.create!(
      status:    :lobby,
      rounds:    @max_rounds,
      draw_time: @draw_time,
      uuid:      SecureRandom.uuid,
    )
    player.update(game: game)
  end
end