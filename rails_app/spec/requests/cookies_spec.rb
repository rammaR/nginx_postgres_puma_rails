 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/cookies", type: :request do
  # Cookie. As you add validations to Cookie, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Cookie.create! valid_attributes
      get cookies_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      cookie = Cookie.create! valid_attributes
      get cooky_url(cooky)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_cooky_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      cookie = Cookie.create! valid_attributes
      get edit_cooky_url(cooky)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Cookie" do
        expect {
          post cookies_url, params: { cookie: valid_attributes }
        }.to change(Cookie, :count).by(1)
      end

      it "redirects to the created cookie" do
        post cookies_url, params: { cookie: valid_attributes }
        expect(response).to redirect_to(cooky_url(@cooky))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Cookie" do
        expect {
          post cookies_url, params: { cookie: invalid_attributes }
        }.to change(Cookie, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post cookies_url, params: { cookie: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested cookie" do
        cookie = Cookie.create! valid_attributes
        patch cooky_url(cooky), params: { cooky: new_attributes }
        cookie.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the cookie" do
        cookie = Cookie.create! valid_attributes
        patch cooky_url(cooky), params: { cooky: new_attributes }
        cookie.reload
        expect(response).to redirect_to(cooky_url(cookie))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        cookie = Cookie.create! valid_attributes
        patch cooky_url(cooky), params: { cooky: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested cookie" do
      cookie = Cookie.create! valid_attributes
      expect {
        delete cooky_url(cooky)
      }.to change(Cookie, :count).by(-1)
    end

    it "redirects to the cookies list" do
      cookie = Cookie.create! valid_attributes
      delete cooky_url(cooky)
      expect(response).to redirect_to(cookies_url)
    end
  end
end
