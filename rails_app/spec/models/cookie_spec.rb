require 'rails_helper'

RSpec.describe Cookie do
  
  it "this cookie can have flavor chocolat" do
    subject.flavor = 'Chocolat'
    expect(subject).to have_attributes(flavor: 'Chocolat')
  end
  
end
