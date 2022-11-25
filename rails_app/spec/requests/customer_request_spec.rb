require 'rails_helper'

RSpec.describe CustomerController, type: :controller do

    it 'renders the index template' do
        get :index
        puts response
        #expect(response).to render_template("index")
        expect(response).to be_success
        expect(response).to have_http_status '200'
    end

end
