require 'rails_helper'

RSpec.describe "minutelists/edit", type: :view do
  before(:each) do
    @minutelist = assign(:minutelist, Minutelist.create!(
      minute: "MyText",
      member: "MyString"
    ))
  end

  it "renders the edit minutelist form" do
    render

    assert_select "form[action=?][method=?]", minutelist_path(@minutelist), "post" do

      assert_select "textarea[name=?]", "minutelist[minute]"

      assert_select "input[name=?]", "minutelist[member]"
    end
  end
end
