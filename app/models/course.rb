# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :groups, dependent: :destroy

  has_one :closest_starting_group,
    -> { order(start_at: :asc) },
    class_name: "Group",
    inverse_of: :course

  validates :title,
    presence: true,
    length: {
      minimum: 1, maximum: 255
    }
end
