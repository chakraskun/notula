# frozen_string_literal: true

class TeamSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :name, :desc

  has_many :members, serializer: MemberSerializer
  has_many :notes, serializer: NotesSerializer
end
