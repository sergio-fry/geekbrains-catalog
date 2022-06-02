require "rails_helper"

RSpec.describe "Apis", type: :request do
  def pretty_json(json)
    JSON.pretty_generate(JSON.parse(response.body))
  end

  describe "GET /category" do
    let(:category) { FactoryBot.create :category }
    it "works! (now write some real specs)" do
      get category_path(category.id, format: :json)
      expect(response).to have_http_status(200)
      puts pretty_json(response.body)
    end
  end
end
