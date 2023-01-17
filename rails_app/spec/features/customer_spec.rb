require 'rails_helper'
require_relative '../support/customer.pop'

RSpec.feature "Customers", type: :feature do
  
  context 'quando usuário autenticado' do
    before(:each) do
      user = create(:user)
      login_as(user, :scope => :user)
    end

    scenario "Deve existir link para clientes em home" do
      visit(root_path)
      expect(page).to have_link("Cadastro de Clientes")
    end

    scenario "Deve existir link de Cadastro de Novo Cliente" do
      visit(root_path)
      click_on('Cadastro de Clientes')
      expect(page).to have_content('Listando Clientes')
      expect(page).to have_link('Cadastrar Novo Cliente')
    end
  
    scenario "Deve permitir cadastrar novo cliente" do
      customer_form = NewCustomerForm.new

      customer_form.login.visit_page.fill_in_with(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        address: Faker::Address.street_address
      ).submit

      expect(page).to have_content('Customer was successfully created.')
    end

    scenario "Não deve permitir cadastro inválido" do
      visit(new_customer_path)

      click_button('Salvar novo cliente')

      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Address can't be blank")
      expect(page).to have_content("Email can't be blank")
    end    

    scenario 'Mostra um cliente' do
      customer = create(:customer)
      visit(customer_path(customer.id))
      expect(page).to have_content(customer.name)
    end

    scenario 'Mostra lista de clientes' do
      customerA = create(:customer)
      customerB = create(:customer)
      customerC = create(:customer)
      visit(customers_path)
      expect(page).to have_content(customerA.name).and have_content(customerB.name).and have_content(customerC.name)
    end

    scenario 'Atualiza um cliente' do
      customer = create(:customer)
      new_name = Faker::Name.name
      
      visit(edit_customer_path(customer.id))
      fill_in('Name', with: new_name)
      click_button('Salvar novo cliente')

      expect(page).to have_content(new_name)
    end

    scenario 'Clica no link Mostrar' do
      customer = create(:customer)
      visit(customers_path)
      find(:xpath, "/html/body[@class='nav-md']/div[@class='container body']/div[@class='main_container']/div[@class='right_col']/div/div[@class='page-title']/div[@class='title_left']/div[@class='container']/table[@class='table table-striped']/tbody/tr[1]/td[4]/a").click

      expect(page).to have_content("Mostrando Cliente")
    end

    scenario 'Clica no link Editar' do
      customer = create(:customer)
      visit(customers_path)
      find(:xpath, "/html/body[@class='nav-md']/div[@class='container body']/div[@class='main_container']/div[@class='right_col']/div/div[@class='page-title']/div[@class='title_left']/div[@class='container']/table[@class='table table-striped']/tbody/tr[1]/td[5]/a").click

      expect(page).to have_content("Editando cliente")
    end
  end
end