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
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  validates :quantity, presence: true, inclusion: { in: 1..99 }
end
