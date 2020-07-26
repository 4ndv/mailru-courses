# frozen_string_literal: true

ActiveAdmin.register Group do
  includes :course

  permit_params :start_at, :course_id

  index do
    selectable_column
    id_column
    column :course
    column :start_at
    column :students_count
    column :created_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      input :course
      input :start_at, as: :date_time_picker
    end
    f.actions
  end

  show do
    attributes_table do
      row :course
      row :start_at
      row :students_count
      row :created_at
      row :updated_at
    end

    active_admin_comments
  end
end
