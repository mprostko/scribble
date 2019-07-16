class InvitationsController < ApplicationController

  # Create a form with username to create a new player
  def new
    @game = find_game
    return render json: { ok: 'game not found' } unless @game
  end

  # Join a game
  def update
    player = CreatePlayer.new(
      username: params[:username],
      game:     find_game
    ).perform

    if player.persisted?
      session[:uuid] = player.uuid
      redirect_to player_path # game show
    else
      render json: { ok: 'game not found' }
    end
  end

  private

  def find_game
    Game.find_by!(
      uuid: params[:uuid],
      status: [:lobby, :game]
    )
  end
end