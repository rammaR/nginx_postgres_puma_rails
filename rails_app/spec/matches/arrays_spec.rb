describe Array.new do
    context 'Quando arrays' do
        it "Array deve começar vazio" do
            expect(subject.size).to eq(0)
        end

        it "Array deve permitir adicionar novos elementos" do
            subject.push(2)
            expect(subject).to include(2)
        end

        it "Array deve permitir a comparação simples" do
            subject.push(3)
            subject.push(4)
            subject.push(5)
            is_expected.to include(5)
            is_expected.to match_array([2,3,4,5])
            is_expected.not_to include(1)
        end
    end
end

describe (0..100) do

    it 'Deve incluir numero de 0 a 100' do
        expect(subject).to cover(0)
        expect(subject).to cover(50)
        expect(subject).to cover(100)
    end

end