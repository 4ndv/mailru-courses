# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :students, dependent: :destroy

  belongs_to :closest_starting_group,
              class_name: "Group",
              inverse_of: :course,
              optional: true

  validates :title,
    presence: true,
    length: {
      minimum: 1, maximum: 255
    }
end
