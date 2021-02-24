class TeamSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :name, :desc

  has_many :members
  has_many :notes, serializer: NotesSerializer
end
