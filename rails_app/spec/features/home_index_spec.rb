require 'rails_helper'

RSpec.feature "HomeIndices", type: :feature do

  scenario 'Mostra tela de titulo' do
    visit(root_path)
    expect(page).to have_content("Cadastro de Clientes")
  end

  scenario 'Existe um link para Cadastro de Clientes' do
    visit(root_path)
    expect(page.find_link("Cadastro de Clientes")).to be_visible
  end
end