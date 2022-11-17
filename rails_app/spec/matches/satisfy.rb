describe "satisfy" do
    
    it { 
        expect(1).to satisfy{
            |w| w % 2 == 1
        }
    } 

    it{
        expect(2).to satisfy('2 be even') do |z| 
            z % 2 ==0
        end
    }
    
end