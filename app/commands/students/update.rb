# frozen_string_literal: true

module Students
  class Update
    prepend ::SimpleCommand

    def initialize(params)
      @params = params
    end

    def call
      return errors.add(:student, 'does not exist') if student.nil?

      if student.update!(@params)
        student
      else
        errors.add(:student, 'unable to update')
      end
    end

    private

    def student
      @student ||= Student.find(@params[:id])
    end
  end
end
