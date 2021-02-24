class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
    setup do
        @team = teams(:one)
    end

    test "should show team" do
        get api_v1_team_url(@team), as: :json
        assert_response :success
        json_response = JSON.parse(self.response.body)
        assert_equal @team.username, json_response['username']
    end
end