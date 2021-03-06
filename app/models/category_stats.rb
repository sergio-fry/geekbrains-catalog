class CategoryStats
  def initialize(category)
    @category = category
  end

  def items_count
    @category.items.count
  end

  def items_sold
    @category.items.joins(:order_items).sum("order_items.quantity")
  end

  def title
    @category.title
  end

  def to_model
    @category
  end
end
