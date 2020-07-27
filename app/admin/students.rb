# frozen_string_literal: true

ActiveAdmin.register Student do
  includes :course, :group

  permit_params :name, :email

  actions :index, :show, :destroy, :edit

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :course
    column :group
    column :created_at
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      input :name
      input :email
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :course
      row :group
      row :created_at
      row :updated_at
    end

    active_admin_comments
  end
end
