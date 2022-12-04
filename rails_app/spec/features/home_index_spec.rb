require 'rails_helper'

RSpec.feature "Home", type: :feature do
   
    it 'shows the app title' do
        visit :root
        expect(page.text).to match(/Aplicação de Criptmoedas/)
    end

end