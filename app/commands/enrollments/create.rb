# frozen_string_literal: true

module Enrollments
  class Create
    prepend ::SimpleCommand
    def initialize(params)
      @params = params
    end

    def call
      Enrollment.create(@params)
    end
  end
end
