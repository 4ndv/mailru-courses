# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :students, dependent: :destroy

  belongs_to :course

  validates :start_at,
    presence: true

  after_commit :update_closest_starting_group, on: [:create, :update]

  private

    def update_closest_starting_group
      # At least one group will be exist, when this is called
      course.update!(
        closest_starting_group: course.groups.order(start_at: :asc).first
      )
    end
end
