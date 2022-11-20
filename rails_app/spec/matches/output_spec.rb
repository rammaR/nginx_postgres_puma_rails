describe 'Matcher output' do
    it {
        expect{puts "Ramar"}.to output.to_stdout
    }

    it{
        expect{ puts "Ramar"}.to output(/Ramar/).to_stdout
    }

    it{
        expect{warn "Error"}.to output(/Error/).to_stderr
    }
end