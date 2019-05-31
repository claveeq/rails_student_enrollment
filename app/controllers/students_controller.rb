class StudentsController < ApplicationController
  def index
    command = Students::Index.call
    render json: command.result
  end

  def create
    command = Students::Create.call(request_params)
    render_wrapper(
      data: command.result,
      errors: command.errors,
      status: :ok
    )
  end

  def update
    command = Students::Update.call(update_params)
    render_wrapper(
      data: command.result,
      errors: command.errors,
      status: :ok
    )
  end

  def destroy
    command = Students::Remove.call(params[:id])
    render_wrapper(
      data: command.result,
      errors: command.errors,
      status: :ok
    )
  end

  private

  def request_params
    params.require(:student).permit(:first_name, :last_name)
  end

  def update_params
    @update_params ||= request_params.merge(id: params[:id])
  end
end
