class GamesController < ApplicationController
  before_action :set_game, only: [:join, :show]

  def join
    @game.second_player = game_params[:second_player]
    @game.second_player_letter = @game.first_player_letter == 'O' ? 'X' : 'O'
    @game.save
    GameChannel.broadcast_to(@game, { domain: 'join', data: { second_player: game_params[:second_player] } })
    render json: @game
  end

  def show
    render json: @game
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  private

    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:first_player, :first_player_letter, :second_player)
    end
end
