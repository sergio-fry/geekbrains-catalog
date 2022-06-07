require 'rails_helper'

RSpec.describe ItemSerializer do
  subject(:serialized) { described_class.new(item).as_json }
  let(:item) { FactoryBot.build(:item, title: 'Title', category:) }
  let(:category) { FactoryBot.build(:category, title: 'Cars') }

  it do
    expect(serialized[:title]).to eq 'Title'
    expect(serialized[:category_title]).to eq 'Cars'
  end
end
