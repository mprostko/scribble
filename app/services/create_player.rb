class CreatePlayer
  def initialize(username:, game:)
    @username = username
    @game     = game
  end

  def perform
    Player.create!(
      username: @username,
      game:     @game,
      uuid:     SecureRandom.uuid
    )
  end
end