class ApplicationController < ActionController::API
  include ExceptionsHandler

  def render_wrapper(status: nil, errors: nil, data: nil, serializer: nil)
    @data = data
    @serializer = serializer
    data = serialized_data if serializer.present?

    render json: {
            data: data,
            errors: errors
           },
           status: status
  end
end
