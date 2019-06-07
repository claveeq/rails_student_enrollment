module Courses
  class Remove
    prepend ::SimpleCommand

    def initialize(id)
      @id = id
    end

    def call 
      if course.present? && course.destroy
        @id
      else
        errors.add(:course, 'unable to remove')
      end
    end

    private

    def course
      @course ||= Course.find(@id)
    end
  end
end