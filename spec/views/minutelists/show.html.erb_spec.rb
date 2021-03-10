# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'minutelists/show', type: :view do
  before(:each) do
    @minutelist = assign(:minutelist, Minutelist.create!(
                                        minute: 'MyText',
                                        member: 'Member'
                                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Member/)
  end
end
