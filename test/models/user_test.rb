test 'test01' do
    team = Team.new(username: 'asdasdasd', password_digest: 'asdasdasdqweda')
    assert team.valid?
end

# test 'user with taken email should be invalid' do
#     other_team = teams(:one)
#     team = Team.new(username: other_team.username, password_digest:
#     'test')
#     assert_not team.valid?
# end

