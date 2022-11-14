describe "Matchers de Comparação" do
    
    context "equal diz: " do        
        it "Dois objetos com valores iguais não são o mesmo objeto" do
            x = "ruby"
            y = "ruby"
            expect(x).not_to equal(y)
        end

        it "O mesmo objeto deve possuir a mesma referência" do
            x = "ruby"
            expect(x).to equal(x)
        end
    end    

    context "be diz: " do
        it "Dois objetos com valores identicos não são o mesmo objeto" do
            x = "ruby"
            y = "ruby"
            expect(x).not_to be(y)
        end        
    end

    context "eql diz: " do
        it "Dois objetos com valores iguais são o mesmo objeto" do
            x = "ruby"
            y = "ruby"
            expect(x).to eql(y)
        end
        
    end

    context "eq diz: " do
        it "Dois objetos com valores iguais são o mesmo objeto" do
            x = "ruby"
            y = "ruby"
            expect(x).to eq(y)
        end
        
    end
    
end
