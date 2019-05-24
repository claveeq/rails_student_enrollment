module Students
  class Index
    prepend ::SimpleCommand

    def call
      Student.all
    end
  end
end
