# frozen_string_literal: true

FactoryBot.define do
  factory :group do
    start_at { 2.days.ago }

    course
  end
end
