class Stats
  def top_categories
    Category.limit(10).map { |category| CategoryStats.new(category) }
  end

  def top_items
    Item.limit(10).map { |item| ItemStats.new(item) }
  end

  def top_users
    User.limit(10).map { |user| UserStats.new(user) }
  end
end
