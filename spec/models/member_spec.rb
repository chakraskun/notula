# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Member, type: :model do
  it { should validate_presence_of(:name) }
  it { should belong_to(:team) }
end
