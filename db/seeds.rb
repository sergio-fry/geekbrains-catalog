# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admin = User.find_or_initialize_by(email: "admin@example.com")
admin.role = :admin
admin.name = "Admin"
admin.password = admin.password_confirmation = "secret123"
admin.save!

user = User.find_or_initialize_by(email: "user@example.com")
user.role = :default
user.name = "User"
user.password = user.password_confirmation = "secret123"
user.save!
