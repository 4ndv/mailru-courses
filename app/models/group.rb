# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :students, dependent: :destroy

  belongs_to :course

  validates :start_at,
    presence: true
end
