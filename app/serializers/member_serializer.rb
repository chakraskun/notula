class MemberSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :desc, :team_id
end
