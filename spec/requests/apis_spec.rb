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

  describe "GET /item/:id" do
    let(:item) { FactoryBot.create :item }
    it "works! (now write some real specs)" do
      get item_path(item.id, format: :json)
      expect(response).to have_http_status(200)
      puts pretty_json(response.body)
    end
  end

  describe "GET /items" do
    before { FactoryBot.create :item }
    before { FactoryBot.create :item }

    it "works! (now write some real specs)" do
      get items_path(format: :json)
      expect(response).to have_http_status(200)
      puts pretty_json(response.body)
    end
  end
end
