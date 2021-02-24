class NotesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :letternum, :agenda, :datetim, :minutes, :addnote

  has_many :teams, serializer: TeamSerializer
end