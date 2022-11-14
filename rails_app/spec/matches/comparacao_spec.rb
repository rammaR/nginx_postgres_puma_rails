describe "Matchers de Comparação" do

    it '5 > 2' do
        expect(5).to be > 2
    end

    it '5 >= 4 and 5 >= 5' do
        expect(5).to be >= 4
        expect(5).to be >= 5
    end
    
    it '1 <= 10 and 10 <= 10' do
        expect(1).to be < 10
        expect(1).to be <= 10
    end

    it '5 has to be between 1 and 10' do
        expect(5).to be_between(1,10).inclusive
        expect(5).to be_between(-5, 100).inclusive
        expect(5).to be_between(-100 ,100).inclusive
    end

    it 'email has to contain @ between one or more letters' do
        expect("fulano@com.br").to match(/..@../)
    end

    it "fulano começa com ful" do
        expect("fulano").to start_with('ful')
    end

    it "fulano deve terminar com ano" do
        expect("fulano").to end_with 'ano'
    end

end