describe 'Test Doubles', type: :doubles do

    it 'User has to have name and password' do

        user = double('User')
        allow(user).to receive(:name)
        allow(user).to receive(:password)
        allow(user).to receive_messages(:age => 42)
        puts user.name
        puts user.password
        puts user.age
    end

end