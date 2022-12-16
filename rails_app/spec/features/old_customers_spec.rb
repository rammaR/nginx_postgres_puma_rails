require 'rails_helper'
require_relative '../support/customer.pop'

RSpec.feature "Customers", type: :feature do
  
  context 'when visiting index' do
    context 'without POP' do
      before(:each) do
        user = create(:user)
        login_as(user, :scope => :user)
      end

      scenario 'Visitar página de clientes' do
        # visit - capybara command to simulate an user visiting a page
        visit(user_backoffice_customers_path)
        # save_and_open_page
        # page - represents the visited page
        # expected to page have the same url of the test case
        expect(page).to have_current_path(user_backoffice_customers_path)
      end

      it 'Creates a Customer' do
        visit(new_user_backoffice_customer_path)

        fill_in('Name', with: Faker::Name.name)
        fill_in('Email', with: Faker::Internet.email)
        fill_in('Address', with: Faker::Address.street_address)

        click_button('Create Customer')

        expect(page).to have_content("Customer was successfully created.")
      end
    end

    context 'with POP' do
      it 'Create a customer - POP' do
        new_customer_form = NewCustomerForm.new
        
        new_customer_form.login.visit_page.fill_in_with(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          address: Faker::Address.street_address
        ).submit

        expect(page).to have_content('Customer was successfully created.')
      end
    end
  end
end
