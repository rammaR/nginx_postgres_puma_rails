require 'rails_helper'

RSpec.describe CustomerController, type: :controller do

    describe "as a Guest" do   
        context "accessing index" do        
            it 'renders successfully' do        
                get :index
                
                expect(response).to be_success
                expect(response).to have_http_status(:success)
            end
        end

        context 'accessing show' do
            it 'responds a 302 response (not_authorized)' do
                customer = create(:customer)
                get :show, params: {id: customer.id}
                expect(response).to have_http_status(302)
            end
        end
    end

    describe 'as a Member' do
        before do
            @member = create(:member)
            @customer = create(:customer)
        end

        context 'accessing show' do
            it 'renders successfully' do        
                sign_in @member
        
                get :show, params: {id: @customer.id }
                expect(response).to have_http_status(200)
                expect(response).to render_template(:show)
            end
        end

        context 'creating a customer' do
            it 'with valid attributes' do
                customer_params = attributes_for(:customer)

                sign_in @member
                
                expect{
                    post :create, params: {customer: customer_params}
                }.to change(Customer, :count).by(1)
            end

            context 'successfully' do
                it 'should appear positive message' do
                    customer_params = attributes_for(:customer)
                    sign_in @member
                    post :create, params: { customer: customer_params }
                    expect(flash[:notice]).to match(/successfully created/)
                end

                it 'should renders json successfully' do
                    customer_params = attributes_for(:customer)
                    sign_in @member
                    post :create, format: :json, params: { customer: customer_params }
                    expect(response.content_type).to eq('application/json')
                end
            end


        end
    end

end
