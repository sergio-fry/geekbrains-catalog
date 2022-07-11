class FakeData
  def initialize(multiplier: 1)
    @multiplier = multiplier
  end

  def generate
    generate_categories
    generate_items
    generate_users
    generate_orders
    generate_comments
  end

  def generate_categories
    Category.transaction do
      (10 * @multiplier).times do
        Category.create! title: FFaker::Book.genre
      end
    end
  end

  def generate_items(categories = Category.all)
    categories.each do |category|
      Item.transaction do
        (rand(10..25) * @multiplier).times do
          category.items.create! title: FFaker::Book.title, price: rand(1..100)
        end
      end
    end
  end

  def generate_users
    User.transaction do
      (10 * @multiplier).times do
        User.create!(
          email: FFaker::Internet.email,
          password: "secret123",
          password_confirmation: "secret123"
        )
      end
    end
  end

  def generate_orders(users = User.all)
    users.each do |user|
      Order.transaction do
        (3 * @multiplier).times do
          order = user.orders.build
          sample_items(3).each do |item|
            order.order_items.build(item: item, quantity: rand(1..10))
          end

          order.save!
        end
      end
    end
  end

  def generate_comments
    Item.find_each do |item|
      root = create_comment(item)
      create_comment(item, root)

      second = create_comment(item, root)
      create_comment(item, second)

      create_comment(item, root)
    end
  end

  private

  def create_comment(item, parent = nil)
    Comment.create!(
      user: random_user,
      text: FFaker::HipsterIpsum.paragraphs,
      commentable: item,
      parent: parent
    )
  end

  def random_user
    @random_user = User.first
  end

  def sample_items(count)
    Item.offset(rand(Item.count)).limit(count)
  end
end
