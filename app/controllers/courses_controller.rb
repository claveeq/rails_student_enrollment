# frozen_string_literal: true

class CoursesController < ApplicationController
  def index
    command = Courses::Index.call
    render_wrapper(
      data: command.result,
      errors: command.errors,
      status: :ok
    )
  end

  def create
    command = Courses::Create.call(request_params)
    render_wrapper(
      data: command.result,
      errors: command.errors,
      status: :ok
    )
  end

  def destroy
    command = Courses::Remove.call(params[:id])
    render_wrapper(
      data: command.result,
      errors: command.errors,
      status: :ok
    )
  end

  private

  def request_params
    params.require(:course).permit(:name, :unit)
  end
end
