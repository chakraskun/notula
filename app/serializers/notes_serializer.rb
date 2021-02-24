class NotesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :letternum, :agenda, :datetim, :minutes, :addnote, :attendance

  has_many :teams, serializer: TeamSerializer
end