# frozen_string_literal: true

FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email(name: name) }

    group
    course { group.course }
  end
end
