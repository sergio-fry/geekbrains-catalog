require "rails_helper"

RSpec.describe FakeData do
  let(:fake_data) { described_class.new }
  it "generates categories" do
    expect do
      fake_data.generate_categories
    end.to change(Category, :count)
  end

  it "generates items" do
    expect do
      fake_data.generate_items(FactoryBot.create_list(:category, 3))
    end.to change(Item, :count)
  end

  it "generates users" do
    expect do
      fake_data.generate_users
    end.to change(User, :count)
  end

  it "generates orders" do
    FactoryBot.create_list(:item, 3)

    expect do
      fake_data.generate_orders(FactoryBot.create_list(:user, 3))
    end.to change(Order, :count)
  end
end
