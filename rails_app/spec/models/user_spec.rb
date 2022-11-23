require 'rails_helper'

RSpec.describe User do
  it "eh valido quando contem o primeiro nome, sobrenome e email" do
    user = create(:user, name: 'Bruce')
    
    expect(user).to be_valid
    expect(user.name).to eq('Bruce')
  end

  it "eh invalido sem o primeiro nome" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'User has to have name and email' do
    user = create(:user)
    # puts(user.name)
    expect(user.name).not_to eq("")
    expect(user.lastname).not_to eq("")
    expect(user.email).not_to eq("")
  end

  it {
    expect{
      create(:user).to change{ User.all.size }.by(1)
    }
  }

  it 'Deve haver um usuario admin' do
    user = create(:customer, name: 'Admin')
    expect(user.name).to eq('Admin')
  end
end
