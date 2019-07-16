class GamesController < ApplicationController

  # New game form
  def new
    session.clear
  end

  # Create a new game and the player
  def create
    puts params
    game = CreateGame.new(
      max_rounds: params[:max_rounds],
      draw_time: params[:draw_time],
    ).perform
    player = CreatePlayer.new(
      username: params[:username],
      game: game,
      creator: true
    ).perform

    if game.persisted? && player.persisted?
      session[:uuid] = player.uuid
      redirect_to player_path
    else
      render json: { ok: 'gra nie zapisana :(' }
    end
  end

  # Generate rounds, start game
  def update
    player = Player.find_by!(uuid: session[:uuid])
    game = player.game

    if game.creator == player
      game.max_rounds.times do
        CreateRound.new(game: game).perform
      end
      NextRound.new(game: game).perform
      game.playing!
    end

    redirect_to player_path
  end
end