require 'rails_helper'

RSpec.describe "cookies/show", type: :view do
  before(:each) do
    @cookie = assign(:cookie, Cookie.create!(
      flavor: "Flavor",
      price: 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Flavor/)
    expect(rendered).to match(/2.5/)
  end
end
