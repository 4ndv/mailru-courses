# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.references :group, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end

    # Disallow two students with the same email in one group, but allow two students with the same email in one course
    add_index :students, [:email, :group_id], unique: true
  end
end
