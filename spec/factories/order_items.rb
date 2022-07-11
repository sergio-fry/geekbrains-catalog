# == Schema Information
#
# Table name: order_items
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer
#  order_id   :integer
#
# Indexes
#
#  index_order_items_on_order_id_and_item_id  (order_id,item_id) UNIQUE
#
FactoryBot.define do
  factory :order_item do
    order_id { 1 }
    item_id { 1 }
    quantity { 1 }
  end
end
