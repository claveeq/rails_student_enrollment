# frozen_string_literal: true

module Students
  class Enroll
    prepend ::SimpleCommand

    def initialize(params)
      @params = params
    end

    def call
      Enrollments.create(params)
    end
  end
end
