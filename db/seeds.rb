# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create AdminUser, in any environment, because of the nature of the task
AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")

courses = FactoryBot.create_list(:course, 10)

courses.each do |course|
  groups = FactoryBot.create_list(:group, rand(1..5), course: course)

  groups.each do |group|
    FactoryBot.create_list(:student, rand(0..10), group: group)
  end
end
