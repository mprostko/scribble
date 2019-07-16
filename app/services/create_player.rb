class CreatePlayer
  def initialize(username:, game:, creator: false)
    @username = username
    @game     = game
    @creator  = creator
  end

  def perform
    Player.create!(
      username: @username,
      game:     @game,
      uuid:     SecureRandom.uuid,
      creator:  @creator
    )
  end
end