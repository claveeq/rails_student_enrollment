class CoursesController < ApplicationController
  def index
    command = Courses::Index.call
    render_wrapper(
      data: command.result,
      errors: command.errors,
      status: :ok
    )
  end
end
