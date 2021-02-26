require 'rails_helper'

RSpec.describe "minutelists/index", type: :view do
  before(:each) do
    assign(:minutelists, [
      Minutelist.create!(
        minute: "MyText",
        member: "Member"
      ),
      Minutelist.create!(
        minute: "MyText",
        member: "Member"
      )
    ])
  end

  it "renders a list of minutelists" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Member".to_s, count: 2
  end
end
