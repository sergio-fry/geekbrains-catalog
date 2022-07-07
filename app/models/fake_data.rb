class FakeData
  def initialize(multiplier: 1)
    @multiplier = multiplier
  end

  def generate
    generate_categories
    generate_items
    generate_users
    generate_orders
  end

  def generate_categories
    (10 * @multiplier).times do
      Category.create! title: FFaker::Book.genre
    end
  end

  def generate_items(categories = Category.all)
    categories.each do |category|
      (25 * @multiplier).times do
        category.items.create! title: FFaker::Book.title, price: rand(1..100)
      end
    end
  end

  def generate_users
    (100 * @multiplier).times do
      User.create!(
        email: FFaker::Internet.email,
        password: "secret123",
        password_confirmation: "secret123"
      )
    end
  end

  def generate_orders(users = User.all)
    users.each do |user|
      (3 * @multiplier).times do
        order = user.orders.build
        sample_items(3).each do |item|
          order.order_items.build(item: item, quantity: rand(1..10))
        end

        order.save!
      end
    end
  end

  private

  def sample_items(count)
    Item.offset(rand(Item.count)).limit(count)
  end
end
