module Students
  class Remove
    prepend ::SimpleCommand
    def initialize(id)
      @id = id
    end

    def call
      if student.present? && student.destroy
        @id
      else
        errors.add(:student, 'unable to remove')
      end
    end

    private

    def student
      @student ||= Student.find(@id)
    end
  end
end
