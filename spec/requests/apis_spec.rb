require "rails_helper"

RSpec.describe "Apis", type: :request do
  describe "GET /apis" do
    it "works! (now write some real specs)" do
      get apis_path
      expect(response).to have_http_status(200)
    end
  end
end
