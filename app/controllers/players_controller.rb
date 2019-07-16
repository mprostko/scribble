class PlayersController < ApplicationController

  # Shows current player's game
  def show
    player = Player.find_by!(uuid: params[:uuid])
    game = player.game
  end

  # Generate rounds, start game
  def update
    player = Player.find_by!(uuid: params[:uuid])
    game = player.game

    GenerateRounds.new(game: game).perform

    game.playing!

    render :show
  end
end