class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @team = Team.find_by(username: params[:username])
    if @team && @team.authenticate(params[:password])
        session[:team_id] = @team.id
        redirect_to '/welcome'
    else
        redirect_to '/login'
    end
  end

  def login
  end

  def welcome
  end

  def page_requires_login
    
  end
end
