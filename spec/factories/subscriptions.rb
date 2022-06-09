# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer
#  user_id    :integer
#
FactoryBot.define do
  factory :subscription do
    user_id { 1 }
    item_id { 1 }
  end
end
