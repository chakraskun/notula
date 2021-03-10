# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # include Authenticable

  before_action :authorized
  helper_method :current_team
  helper_method :logged_in?

  def current_team
    Team.find_by(id: session[:team_id])
  end

  def logged_in?
    !current_team.nil?
  end

  def authorized
    redirect_to '/welcome' unless logged_in?
  end

  # protected
  # def check_login
  #     head :forbidden unless self.current_team
  # end

  protect_from_forgery with: :null_session
end
