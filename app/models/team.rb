class Team < ApplicationRecord
    has_many :members
    has_many :noteteamlists
    has_many :notes, through: :noteteamlists

    validates :username, uniqueness: true
    validates :password_digest, presence: true
    has_secure_password
end
