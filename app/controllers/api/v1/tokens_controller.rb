class Api::V1::TokensController < ApplicationController
  def create
    @team = Team.find_by_username(team_params[:username])
    if @team&.authenticate(team_params[:password])
      render json: {
        token: JsonWebToken.encode(team_id: @team.id),
        username: @team.username
      }
    else
      head :unauthorized
    end
  end

  private
  def team_params
    params.require(:team).permit(:username, :password)
  end
end
