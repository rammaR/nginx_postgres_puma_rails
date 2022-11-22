describe 'User Double' do

    it 'User has to have a name' do
        user = double('User', name: "Nome do Usuario")
        
        allow(user).to receive_messages(age: 48)
        allow(user).to receive_messages(password: 'secret')
        allow(user).to receive(:is_connected?).and_return('true')

        expect(user).to have_attributes(name: "Nome do Usuario")
        expect(user.password).to eq('secret')

        expect(user.is_connected?).to be_truthy
    end

end