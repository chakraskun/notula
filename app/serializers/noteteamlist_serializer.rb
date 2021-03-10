class NoteteamlistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :team_id, :note_id
end
