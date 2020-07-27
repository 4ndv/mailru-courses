# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Registered students count" do
          table_for Course.where.not(students_count: 0).order(title: :asc) do
            column("Course") { |course| link_to(course.title, admin_students_path(q: { course_id_eq: course.id })) }
            column("Students") { |course| course.students_count }
          end
        end
      end

      column do
        panel "Courses without students" do
          table_for Course.where(students_count: 0).order(title: :asc) do
            column("Course") { |course| link_to(course.title, admin_students_path(q: { course_id_eq: course.id })) }
          end
        end
      end
    end
  end
end
