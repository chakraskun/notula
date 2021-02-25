class Team < ApplicationRecord
    has_secure_password
    has_many :members
    has_many :noteteamlists
    has_many :notes, through: :noteteamlists

    validates :username, uniqueness: true
    validates :password, presence: true
end
