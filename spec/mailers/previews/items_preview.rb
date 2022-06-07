# Preview all emails at http://localhost:3000/rails/mailers/items
class ItemsPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/items/notify_user
  def notify_user
    ItemsMailer.notify_user(User.last, Item.limit(7).to_a)
  end
end
