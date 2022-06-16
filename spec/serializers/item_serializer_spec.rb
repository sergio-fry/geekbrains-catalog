# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  price       :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
require "rails_helper"

RSpec.describe ItemSerializer do
  subject(:serialized) { described_class.new(item).as_json }
  let(:item) { FactoryBot.build(:item, title: "Title", category:) }
  let(:category) { FactoryBot.build(:category, title: "Cars") }

  it do
    expect(serialized[:title]).to eq "Title"
    expect(serialized[:category_title]).to eq "Cars"
  end
end
