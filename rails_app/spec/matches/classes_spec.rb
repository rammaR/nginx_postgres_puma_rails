require 'rails_helper'

describe "Class Test" do
    
    it 'any number has to be instance of number' do
        expect(1).to be_instance_of(Integer)
    end

    it "any word has to be instance of String" do
        expect("palavra").to be_instance_of(String)
    end

    it "cookie has to be a Cookie" do
        cookie = Cookie.new
        expect(cookie).to be_a(Cookie)
    end

    it "100 has to be an Integer" do
        expect(100).to be_an Integer
    end

end