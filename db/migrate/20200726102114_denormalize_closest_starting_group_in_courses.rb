# frozen_string_literal: true

class DenormalizeClosestStartingGroupInCourses < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :closest_starting_group, foreign_key: { to_table: :groups }
  end
end
