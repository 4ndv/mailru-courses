# frozen_string_literal: true

class Student < ApplicationRecord
  belongs_to :group, counter_cache: true
  belongs_to :course, counter_cache: true

  validates :name,
    presence: true,
    length: { minumum: 1, maximum: 255 }

  validates :email,
    presence: true,
    length: { minimum: 1, maximum: 255 },
    format: { with: URI::MailTo::EMAIL_REGEXP },
    # Disallow two students with the same email in one group,
    # but allow two students with the same email in one course
    uniqueness: { scope: [:group_id] }
end
