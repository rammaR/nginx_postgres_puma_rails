require 'rails_helper'

RSpec.describe "cookies/index", type: :view do
  before(:each) do
    assign(:cookies, [
      Cookie.create!(
        flavor: "Flavor",
        price: 2.5
      ),
      Cookie.create!(
        flavor: "Flavor",
        price: 2.5
      )
    ])
  end

  it "renders a list of cookies" do
    render
    assert_select "tr>td", text: "Flavor".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
  end
end
