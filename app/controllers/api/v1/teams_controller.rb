module Api
    module V1
        class TeamsController < ApplicationController
            
            before_action :set_team, only: %i[show]
            before_action :check_owner, only: %i[update destroy]
            skip_before_action :verify_authenticity_token
            
            def index
                teams = Team.all
                render json: TeamSerializer.new(teams, options).serialized_json
            end

            def show
                team = Team.find_by(id: params[:id])
                render json: TeamSerializer.new(team, options).serialized_json
            end

            def create
                team = Team.new(team_params)
                if team.save
                    render json: TeamSerializer.new(team).serialized_json
                else
                    render json: {error: team.errors.messages}, status: 422
                end
            end

            def update
                team = Team.find_by(id: params[:id])
                if team.update(team_params)
                    render json: TeamSerializer.new(team, options).serialized_json
                else
                    render json: {error: team.errors.messages}, status: 422
                end
            end

            def destroy
                team = Team.find_by(id: params[:id])
                if team.destroy
                    render :no_content
                else
                    render json: {error: team.errors.messages}, status: 204
                end
            end

            private

            def team_params
                params.require(:team).permit(:username, :name, :password)
            end

            def options
                @options ||= { include: %i[members]} 
            end

            def check_owner
                head :forbidden unless @team.id == current_team&.id
            end
        end
    end
end