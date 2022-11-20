describe 'A test double', type: :doubles do
    it 'raise errors when messagens not allowed' do
        dbl = double('Collaborator', :foo => 3, :bar => 4)

        expect(dbl.foo).to eq(3)
        expect(dbl.bar).to eq(4)
    end

    it "returns nil from alloews messages" do
        dbl = double("Collaborator")
        allow(dbl).to receive(:foo)
        expect(dbl.foo).to be_nil
    end

    it "configures return values for the provided messages" do
        dbl = double("Collaborator")
        allow(dbl).to receive_messages(:foo => 2, :bar => 3)
        expect(dbl.foo).to eq(2)
        expect(dbl.bar).to eq(3)
    end

    it 'passes if the message is never received' do
        dbl = double("collaborator").as_null_object
        expect(dbl).not_to receive(:foo)
    end
end