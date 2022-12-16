class NewCustomerForm
    
    include Capybara::DSL 
    include FactoryBot::Syntax::Methods
    include Warden::Test::Helpers
    include Rails.application.routes.url_helpers

    def login
      user = create(:user)
      login_as(user, :scope => :user)
      self
    end

    def visit_page
        visit(new_customer_path)
        self
    end

    def fill_in_with(params = {})
        fill_in('Name', with: params.fetch(:name, Faker::Name.name))
        fill_in('Email', with: params.fetch(:email, Faker::Internet.email))
        fill_in('Address', with: params.fetch(:address, Faker::Address.street_address))
        attach_file('Profile', "#{Rails.root}/spec/fixtures/avatar.png")
        choose(option: ['S', 'N'].sample)
        self
    end

    def submit
        click_button('Salvar novo cliente')
    end

end