# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create main sample users
User.create!(username: "User", email: "user@rails.com", password: "password");
User.create!(username: "Admin", email: "admin@rails.com", password: "password", admin: true);

3.times do
  User.create!(username: Faker::Name.name, email: Faker::Internet.email, password: "password");
end

# Create sample categories
5.times do
  Category.create!(name: Faker::Book.unique.genre);
end

# Create sample articles
28.times do
  Article.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    user_id: User.all.sample.id,
    categories: Category.all.sample(rand(1..3))
  );
end