# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_many(:members) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  # it { should belong_to(:team) }
  # pending "add some examples to (or delete) #{__FILE__}"
end
