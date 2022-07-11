class CachedStats
  def initialize
    @stats = Stats.new
  end

  def top_categories
    Rails.cache.fetch "Stats/top_categories", expires_in: 5.minutes do
      @stats.top_categories
    end
  end

  def top_items
    @stats.top_items
  end

  def top_users
    @stats.top_users
  end

  def items_count
    @stats.items_count
  end

  def users_count
    @stats.users_count
  end

  def orders_count
    @stats.orders_count
  end
end
