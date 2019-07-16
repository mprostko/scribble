class PlayersController < ApplicationController

  # Shows current player's game
  def show
    @player = Player.find_by!(uuid: session[:uuid])
    @game = @player.game

    @round = @game.current_round if @game.playing?

    render @game.status.to_sym
  end

  # Guess the word!
  def create
    @player = Player.find_by!(uuid: session[:uuid])
    @game = @player.game

    GuessWord.new(player: @player).perform(params[:word])
    @round = @game.current_round if @game.playing?

    render @game.status.to_sym
  end

  # Leave game
  def destroy
    session.clear

    redirect_to root_path
  end
end