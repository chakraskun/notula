class ApplicationController < ActionController::Base
    include Authenticable
    
    protected
    def check_login
        head :forbidden unless self.current_team
    end
    # protect_from_forgery with: :null_session
end
