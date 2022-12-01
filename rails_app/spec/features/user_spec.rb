describe "The signin process", type: :feature do
    before :each do
        User.create(email: 'user@example.com', password: 'password', password_confirmation: 'password')
    end

    it "signs me in" do
        visit '/sessions/new'
        
        within("#session") do
            fill_in 'Emaill', with: 'user@example.com'
            fill_in 'Password', with: 'password'
        end

        click_button 'Sign in'

        expect(page).to have_content 'Success'
    end

end