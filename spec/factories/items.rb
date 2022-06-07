FactoryBot.define do
  factory :item do
    title { 'MyString' }
    association :category
    price { 1 }
  end
end
