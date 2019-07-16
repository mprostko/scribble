class GamesController < ApplicationController

  # New game form
  def new
    @game = Game.new
  end

  # Create a new game and the player
  def create
    game = CreateGame.new(
      max_rounds: params[:max_rounds],
      round_time: params[:round_time]
    ).perform
    player = CreatePlayer.new(
      nickname: params[:nickname],
      game: game
    ).perform

    if game.persisted? && player.persisted?
      redirect_to @player
    else
      render json: { ok: 'gra nie zapisana :(' }
    end
  end
end