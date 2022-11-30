require 'rails_helper'

RSpec.describe "AdminBackoffice::AdminControls", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admin_backoffice/admin_control/index"
      expect(response).to have_http_status(:success)
    end
  end

end
