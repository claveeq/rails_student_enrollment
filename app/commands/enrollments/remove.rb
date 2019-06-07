module Enrollments
  class Remove
    prepend ::SimpleCommand

    def initialize(id)
      @id = id
    end

    def call
      if enrollment.present? && enrollment.destroy
        @id
      else
        errors.add(:enrollment, 'unable to remove')
      end
    end

    private

    def enrollment
      @enrollment ||= Enrollment.find(@id)
    end
  end
end
