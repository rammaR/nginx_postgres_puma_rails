require 'rails_helper'

RSpec.describe "UserBackoffice::Welcomes", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/user_backoffice/welcome/index"
      expect(response).to have_http_status(:success)
    end
  end

end
