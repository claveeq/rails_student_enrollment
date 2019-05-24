class StudentsController < ApplicationController
  def index
    command = Students::Index.call
    render json: command.result
  end

  def create
    command = Students::Create.call(request_params)
    status = command.success? ? :created : :unprocessable_entity
    render json: command.result, status: status
  end

  private

  def request_params
    params.require(:student).permit(:first_name, :last_name)
  end
end
