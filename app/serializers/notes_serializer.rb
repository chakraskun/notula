# frozen_string_literal: true

class NotesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :letternum, :agenda, :datetim, :addnote, :attend 

  has_many :teams, serializer: TeamSerializer
  has_many :minutelists, serializer: MinutelistSerializer
end
