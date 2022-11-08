require 'rails_helper'

RSpec.describe "cookies/edit", type: :view do
  before(:each) do
    @cookie = assign(:cookie, Cookie.create!(
      flavor: "MyString",
      price: 1.5
    ))
  end

  it "renders the edit cookie form" do
    render

    assert_select "form[action=?][method=?]", cookie_path(@cookie), "post" do

      assert_select "input[name=?]", "cookie[flavor]"

      assert_select "input[name=?]", "cookie[price]"
    end
  end
end
