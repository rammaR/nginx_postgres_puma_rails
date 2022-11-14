describe "Matchers booleanos" do

    it '1 é um número ímpar' do
        expect(1.odd?).to be true
        expect(1.odd?).to be_truthy
    end
    
    it '1 não é par' do
        expect(1.even?).to be false
        expect(1.even?).to be_falsey
    end

    it "w was not be defined" do
        expect(defined? w).to be_nil
    end
end