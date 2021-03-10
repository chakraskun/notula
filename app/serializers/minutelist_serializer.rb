class MinutelistSerializer
  include FastJsonapi::ObjectSerializer
  attributes :minute, :member, :note_id
end
