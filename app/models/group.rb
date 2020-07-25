# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :course

  validates :start_at,
    presence: true
end
