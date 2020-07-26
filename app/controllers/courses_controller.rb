# frozen_string_literal: true

class CoursesController < ApplicationController
  # GET /
  def index
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
end
