class Stats
  def top_categories
    ids = Category.joins(items: :order_items).group(:id).sum(:quantity).sort_by { |id, count| -count }.take(3).map(&:first)
    Category.where(
      id: ids
    ).map { |category| CategoryStats.new(category) }
  end

  def top_items
    ids = Item.joins(:order_items).group(:id).sum(:quantity).sort_by { |id, count| -count }.take(3).map(&:first)
    Item.where(id: ids).map { |item| ItemStats.new(item) }
  end

  def top_users
    ids = User.joins(:order_items).group(:id).sum(:quantity).sort_by { |id, count| -count }.take(3).map(&:first)
    User.where(id: ids).map { |user| UserStats.new(user) }
  end

  def items_count
    Item.count
  end

  def users_count
    User.count
  end

  def orders_count
    Order.count
  end
end
