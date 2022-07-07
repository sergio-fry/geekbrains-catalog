class ItemStats
  def initialize(item)
    @item = item
  end

  def sold_quantity
    @item.order_items.sum(:quantity)
  end

  def sold
    @item.order_items.sum(:quantity) * price
  end

  def price
    @item.price || 0
  end

  def orders
    @item.orders.count
  end
end
