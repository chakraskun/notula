class Member < ApplicationRecord
  belongs_to :team
  has_many :notes, through: :noteteamlists
  validates_presence_of :name
end
