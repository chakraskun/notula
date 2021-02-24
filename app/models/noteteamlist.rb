class Noteteamlist < ApplicationRecord
  belongs_to :team
  belongs_to :note
end
