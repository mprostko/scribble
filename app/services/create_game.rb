class CreateGame
  def initialize(max_rounds: 3, draw_time: 60)
    @max_rounds = max_rounds
    @draw_time  = draw_time
  end

  def perform
    game = Game.create!(
      status:     :lobby,
      max_rounds: @max_rounds,
      draw_time:  @draw_time,
      uuid:       SecureRandom.uuid,
    )
  end
end