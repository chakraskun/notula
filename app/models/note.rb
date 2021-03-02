class Note < ApplicationRecord
    has_many :noteteamlists
    has_many :teams, through: :noteteamlists
    has_many :minutelists, inverse_of: :note
    has_many :members, through: :noteteamlists
    accepts_nested_attributes_for :minutelists, allow_destroy: true, reject_if: :all_blank
    # accepts_nested_attributes_for :attendance, allow_destroy: true, reject_if: :all_blank
    validates_associated :minutelists

end
