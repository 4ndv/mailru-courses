# frozen_string_literal: true

ActiveAdmin.register Course do
  includes :closest_starting_group

  permit_params :title

  index do
    selectable_column
    id_column
    column :title
    column :students_count
    column :start_at, sortable: "groups.start_at" do |course|
      course.closest_starting_group&.start_at || "N/A"
    end
    column :created_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      input :title
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :students_count
      row :start_at do |course|
        course.closest_starting_group&.start_at || "N/A"
      end
      row :created_at
      row :updated_at
    end

    active_admin_comments
  end
end
