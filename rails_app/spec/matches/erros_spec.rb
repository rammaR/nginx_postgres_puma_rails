RSpec.describe "Testando mensagens de erro" do


    it "Has to send NonDivisibleByZeroError" do
        expect{
            10/0
        }.to raise_error(ZeroDivisionError, 'divided by 0')
    end

end