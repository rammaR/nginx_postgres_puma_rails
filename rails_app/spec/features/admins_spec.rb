# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.feature "Admins", type: :feature do
  
    context 'when logging in' do
        it 'should be invalid with email or passwords indalids' do
            visit('/admins/sign_in')

            fill_in('admin_email', with: Faker::Internet.email)
            fill_in('admin_password', with: Faker::Internet.password)

            click_on('Log in')

            expect(page).to have_content(/Invalid Email or password./)
        end

        it 'should be valid with email and password valids' do
            visit('/admins/sign_in')

            fill_in('admin_email', with: 'admin@admin.com')
            fill_in('admin_password', with: 'senhadmin')

            click_on('Log in')

            expect(page).to have_content(/Signed in successfully/)
            #expect(page).to have_current_path(admin_backoffice_welcome_index_path)
        end
    end

    context 'clicking in sign_up' do
        it 'when trying sign up' do
            #visit('/admins/sign_out')
            visit('/admins/sign_in')
            # page.save_screenshot('sign_in.png')
            #save_and_open_page

            click_on('Sign up')

            expect(page).to have_current_path(new_admin_registration_path)
        end
    end

    context 'clicking in forgot your password' do
        it 'clicked forgot password' do
            #visit('/admins/sign_out')
            visit('/admins/sign_in')
            # page.save_screenshot('sign_in.png')
            #save_and_open_page

            click_on('Forgot your password?')

            expect(page).to have_current_path('/admins/password/new')
        end
    end

end

