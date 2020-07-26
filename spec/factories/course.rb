# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    title { Faker::Job.unique.title }
  end
end
