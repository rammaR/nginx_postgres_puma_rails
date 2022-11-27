require 'rails_helper'

RSpec.describe "ProfilesBackoffice::Welcomes", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/profiles_backoffice/welcome/index"
      expect(response).to have_http_status(:success)
    end
  end

end
