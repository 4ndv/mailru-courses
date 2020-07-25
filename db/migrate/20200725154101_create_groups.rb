# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.datetime :start_at, null: false
      t.integer :students_count, null: false, default: 0
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
