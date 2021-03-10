# frozen_string_literal: true

class Note < ApplicationRecord
  has_many :noteteamlists, dependent: :delete_all
  has_many :teams, through: :noteteamlists
  has_many :minutelists, inverse_of: :note, dependent: :delete_all
  has_many :members, through: :noteteamlists
  accepts_nested_attributes_for :minutelists, allow_destroy: true, reject_if: :all_blank
  # accepts_nested_attributes_for :attendance, allow_destroy: true, reject_if: :all_blank
  validates_associated :minutelists
end
