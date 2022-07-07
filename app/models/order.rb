class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  def price
    order_items.map do |order_item|
      order_item.item.price * order_item.quantity
    end.sum
  end
end
