# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: [:show]

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

  private
    def set_course
      @course = Course.find(params[:id])
    end
end
