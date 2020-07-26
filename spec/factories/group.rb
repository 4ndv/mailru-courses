# frozen_string_literal: true

FactoryBot.define do
  factory :group do
    start_at { rand(1..100).days.after }

    course
  end
end
