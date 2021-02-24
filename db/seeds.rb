# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# team = Team.create!([
#     # {username: 'test01',
#     # password_digest: 'test01',
#     # name: 'team hura hura'},
#     # {username: 'test02',
#     # password_digest: 'test02',
#     # name: 'team abc'},
#     # {username: 'test03',
#     # password_digest: 'test03',;
#     # name: 'team lolipop'},
#     {username: 'test04',
#         password_digest: 'test04',
#         name: 'team lolipopiooiol'}
# ])
  
note = Note.create!(
    letternum: '1231231231231231234555',
    agenda: 'LOREM IPSUM LOREM IPSUM',
    datetim: Time.now.to_datetime,
    minutes: 'mama loren minutes minutes minutes',
    addnote: 'additional note for lalalalalala purpose'
)

note.noteteamlists.create(
    team_id: 2,
)