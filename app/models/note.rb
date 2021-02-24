class Note < ApplicationRecord
    has_many :noteteamlists
    has_many :teams, through: :noteteamlists
end
