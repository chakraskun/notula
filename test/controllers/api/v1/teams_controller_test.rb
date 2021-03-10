# frozen_string_literal: true

module Api
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
      setup do
        @team = teams(:one)
      end

      test 'should show team' do
        get api_v1_team_url(@team), as: :json
        assert_response :success
        json_response = JSON.parse(response.body)
        assert_equal @team.username, json_response['username']
      end
    end
  end
end
