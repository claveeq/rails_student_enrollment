module Courses 
  class Create
    prepend ::SimpleCommand
    def initialize(params)
      @params = params
    end

    def call
      Course.create(@params)
    end
  end
end