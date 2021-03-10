class MinutelistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :minute, :member, :note_id

  belongs_to :note, serializer: NotesSerializer
end
