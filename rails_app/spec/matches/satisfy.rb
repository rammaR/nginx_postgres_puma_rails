RSpec::Matchers.define_negated_matcher :not_satisfy, :satisfy

describe "Satisfy" do
    
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

    it{
        expect(2).to not_satisfy('2 cannot be odd') do |z|
            z % 2 == 1
        end
    }
    
end