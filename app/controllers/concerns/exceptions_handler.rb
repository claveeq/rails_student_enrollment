# frozen_string_literal: true
# Handles the exception of the controller
module ExceptionsHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotUnique do |e|
      render_wrapper(
        data: nil,
        errors: e.message,
        status: :conflict
      )
    end

    rescue_from ActiveRecord::NotNullViolation do |e|
      render_wrapper(
        data: nil,
        errors: e.message,
        status: :unprocessable_entity
      )
    end

    rescue_from ActionController::ParameterMissing do |e|
      render_wrapper(
        data: nil,
        errors: e.message,
        status: :bad_request
      )
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render_wrapper(
        data: nil,
        errors: e.message,
        status: :unprocessable_entity
      )
    end

    rescue_from NotImplementedError do |e|
      render_wrapper(
        data: nil,
        errors: e.message,
        status: :bad_request
      )
    end
  end
end
