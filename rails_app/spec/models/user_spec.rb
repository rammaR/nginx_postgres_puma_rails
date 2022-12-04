require 'rails_helper'

RSpec.describe User, type: :model do
  
  context "is not valid when" do
    
    it 'not have email' do
      user = User.new
      expect(user.valid?).not_to be_valid
      expect(user.errors[:email].size).to eq(1)
      expect(user.errors).to has_key(:email)
    end
    
  end
  
end
