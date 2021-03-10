# frozen_string_literal: true

class NotesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :letternum, :agenda, :datetim, :minutes, :addnote, :attendance, :attend, 

  has_many :noteteamlists, serializer: NoteteamlistSerializer
  has_many :teams, serializer: TeamSerializer
end
