# frozen_string_literal: true

class Course < ApplicationRecord
  validates :title,
    precence: true,
    length: {
      minimum: 1, maximum: 255
    }
end
