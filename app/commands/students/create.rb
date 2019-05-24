module Students
  class Create
    prepend ::SimpleCommand
    def initialize(params)
      @params = params
    end

    def call
      Student.create(@params)
    end
  end
end
