class NoteteamlistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :team_id, :note_id

  belongs_to :team, serializer: TeamSerializer
  belongs_to :note, serializer: NotesSerializer
end
