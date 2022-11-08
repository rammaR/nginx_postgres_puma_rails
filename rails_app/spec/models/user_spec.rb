require 'rails_helper'

RSpec.describe User do
  it "eh valido quando contem o primeiro nome, sobrenome e email" do
    #Arrange, Act
    user = User.new(name:'Bruce', lastname: 'Wayne', email: 'batman@gmail.com')
    #Assert
    expect(user).to be_valid
  end

  it "eh invalido sem o primeiro nome" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
end
