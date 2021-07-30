class MovesController < ApplicationController

  def create
    @move = Move.new(move_params)

    if @move.save
      GameChannel.broadcast_to(@move.game, { domain: 'move', data: { letter: move_params[:letter], position: move_params[:position] } })
      winner_check = @move.game.check_win(move_params[:position], move_params[:letter])
      GameChannel.broadcast_to(@move.game, { domain: 'winner', data: { result: "#{move_params[:letter]} is the winner" } }) if winner_check
      GameChannel.broadcast_to(@move.game, { domain: 'winner', data: { result: "It is a draw." } }) if !winner_check && @move.game.moves.count > 8 
      render json: @move, status: :created
    else
      render json: @move.errors, status: :unprocessable_entity
    end
  end

  private

    def move_params
      params.require(:move).permit(:letter, :position, :player, :game_id)
    end
end
