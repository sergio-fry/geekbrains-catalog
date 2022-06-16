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
FactoryBot.define do
  factory :item do
    title { "MyString" }
    association :category
    price { 1 }
  end
end
