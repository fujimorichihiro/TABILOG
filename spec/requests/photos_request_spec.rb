require 'rails_helper'

RSpec.describe "Photos", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/photos/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/photos/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/photos/show"
      expect(response).to have_http_status(:success)
    end
  end

end
