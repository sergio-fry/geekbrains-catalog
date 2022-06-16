require "rails_helper"

RSpec.describe "Grape Root", type: :request do
  def pretty_json(_json)
    JSON.pretty_generate(JSON.parse(response.body))
  end

  describe "GET /api/items/:id" do
    let(:item) { FactoryBot.create :item }

    it "works! (now write some real specs)" do
      get "/api/items/#{item.id}"
      expect(response).to have_http_status(200)
      puts pretty_json(response.body)
    end
  end

  describe "GET /api/items" do
    before { FactoryBot.create :item }
    before { FactoryBot.create :item }

    it "works! (now write some real specs)" do
      get "/api/items"
      expect(response).to have_http_status(200)
      puts pretty_json(response.body)
    end
  end
end
