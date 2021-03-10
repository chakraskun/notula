# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'minutelists/new', type: :view do
  before(:each) do
    assign(:minutelist, Minutelist.new(
                          minute: 'MyText',
                          member: 'MyString'
                        ))
  end

  it 'renders new minutelist form' do
    render

    assert_select 'form[action=?][method=?]', minutelists_path, 'post' do
      assert_select 'textarea[name=?]', 'minutelist[minute]'

      assert_select 'input[name=?]', 'minutelist[member]'
    end
  end
end
