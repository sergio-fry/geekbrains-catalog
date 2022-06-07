# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def create_user(email, name, role)
  user = User.find_or_initialize_by(email: email)
  user.role = role
  user.name = name
  user.password = user.password_confirmation = "secret123"
  user.save!
end

create_user("admin@example.com", "Admin", "admin")
create_user("user@example.com", "User", "user")

20.times do
  create_user(FFaker::Internet.email, FFaker::Name.name, "user")
end

5.times do
  category = Category.create!(
    title: FFaker::Game.category
  )

  category.items.create!(
    title: FFaker::Game.title,
    price: FFaker::Number.decimal
  )
end
