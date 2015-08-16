require "rails_helper"
require 'activeuuid'

RSpec.describe AccountsController, type: :controller do
  include Committee::Test::Methods
  let(:account) { Account.create!(id: UUIDTools::UUID.random_create.to_s, email: email, password: password) }
  let(:email) { Faker::Internet.email }
  let(:new_email) { "new+#{email}" }
  let(:password) { Faker::Internet.password }
  let(:payload) { {jti: SecureRandom.uuid }}
  let(:token) { SecureRandom.uuid }
  let(:schema_path) { "#{Rails.root}/schema/authentication-api.json" }
  let(:last_response) { response }
  let(:last_request) { request }

  describe "POST #create" do
    subject { post :create, params }

    context "when email and password are valid" do
      let(:params) { { account: { email: email, password: password } } }

      it "conforms to schema" do
        subject
        assert_schema_conform
      end

    end
  end

  describe "GET #show" do
    context "when the token is valid" do
      it "returns HTTP status success" do
        get :show, id: account.id
        expect(response).to have_http_status(:success)
      end

     it "conforms to schema" do
        get :show, id: account.id
        puts response.body
        assert_schema_conform
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      account.update(jti: payload[:jti])
      request.headers["Authorization"] = "Bearer #{token}"
    end

    context "when the token is valid" do
      let(:params) { { id: account.id, account: { email: new_email } } }

      it "conforms to schema" do
        put :update, params
        assert_schema_conform
      end
    end
  end
end
