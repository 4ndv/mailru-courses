# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.integer :students_count, null: false, default: 0

      t.timestamps
    end
  end
end
