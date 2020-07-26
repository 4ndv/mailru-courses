# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :students,
            -> { order(name: :asc) },
            dependent: :destroy,
            inverse_of: :group

  belongs_to :course

  has_one :course_as_closest,
          class_name: "Course",
          foreign_key: :closest_starting_group_id,
          dependent: :nullify,
          inverse_of: :closest_starting_group

  validates :start_at,
    presence: true

  after_commit :update_closest_starting_group, on: [:create, :update]

  # Display name for ActiveAdmin
  def display_name
    start_at
  end

  private

    def update_closest_starting_group
      # At least one group will be exist, when this is called
      course.update!(
        closest_starting_group: course.groups.order(start_at: :asc).first
      )
    end
end
