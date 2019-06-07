# frozen_string_literal: true

module Students
  class Show
    prepend ::SimpleCommand

    def initialize(id)
      @id = id
    end

    def call
      if student.present?
        student
      else
        errors.add(:student, 'does not exist')
      end
    end

    private

    def student
      @student ||= Student.find(@id)
    end
  end
end
