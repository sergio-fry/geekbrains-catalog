class UserStats
  def initialize(user)
    @user = user
  end

  def name
    @user.email
  end

  def to_model
    @user
  end

  def sold
    @user.order_items.sum(:quantity)
  end
end
