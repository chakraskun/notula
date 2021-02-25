module Authenticable
    def current_team
        return @current_team if @current_team

        header = request.headers['Authorization']
        return nil if header.nil?
        
        decode = JsonWebToken.decode(header)
        @current_team = Team.find(decoded[:team_id]) rescue ActiveRecord::RecordNotFound
    end
end