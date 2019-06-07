class EnrollmentsController < ApplicationController
  def create
    command = Enrollments::Create.call(request_params)
    render_wrapper(
      data: command.result,
      errors: command.errors,
      status: :ok
    )
  end

  def destroy
    command = Enrollments::Remove.call(params[:id])
    render_wrapper(
      data: command.result,
      errors: command.errors,
      status: :ok
    )
  end

  private

  def request_params
    params.require(:enrollment).permit(:student_id, :course_id)
  end
end
