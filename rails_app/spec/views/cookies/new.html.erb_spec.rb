require 'rails_helper'

RSpec.describe "cookies/new", type: :view do
  before(:each) do
    assign(:cookie, Cookie.new(
      flavor: "MyString",
      price: 1.5
    ))
  end

  it "renders new cookie form" do
    render

    assert_select "form[action=?][method=?]", cookies_path, "post" do

      assert_select "input[name=?]", "cookie[flavor]"

      assert_select "input[name=?]", "cookie[price]"
    end
  end
end
