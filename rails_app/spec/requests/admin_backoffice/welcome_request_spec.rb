require 'rails_helper'

RSpec.describe "AdminBackoffice::Welcomes", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admin_backoffice/welcome/index"
      expect(response).to have_http_status(:success)
    end
  end

end
