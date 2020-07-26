# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :join]

  # GET /
  def index
    @page_title = ["All courses"]

    @courses = Course
                .all
                .includes(:closest_starting_group)
                .where.not(closest_starting_group_id: nil)

    @order = params[:order_by]&.to_sym

    case @order
    when :start_at
      @courses = @courses.order("groups.start_at ASC")
    else
      @order = :title
      @courses = @courses.order(title: :asc)
    end
  end

  # GET /courses/:id
  def show
    @page_title = [@course.title, "Groups"]

    @groups = @course.groups.includes(:students)
  end

  # GET /courses/:id/groups/:group_id/join
  # POST /courses/:id/groups/:group_id/join
  def join
    @page_title = [@course.title, "Join group"]

    @group = @course.groups.find(params[:group_id])

    @student = Student.new(
      student_params.merge(
        group: @group,
        course: @course
      )
    )

    if request.post?
      if @student.save
        redirect_to course_path(@course.id), notice: "You have successfully joined course: \"#{@course.title}\", your group will start at #{@group.start_at}"
      end
    elsif !request.get?
      raise ActionController::RecordNotFound
    end
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def student_params
      params.fetch(:student, {}).permit(:name, :email)
    end
end
