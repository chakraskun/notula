json.extract! team, :id, :name, :desc, :created_at, :updated_at, :password
json.url team_url(team, format: :json)
