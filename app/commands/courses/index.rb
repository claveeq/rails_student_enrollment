module Courses
  class Index
    prepend ::SimpleCommand

    def call
      Course.all
    end
  end
end