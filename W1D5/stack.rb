class Stack
    attr_accessor :ivar
    def initialize(ivar)
      @ivar = ivar
    end

    def push(el)
      @ivar << el
    end

    def pop
      @ivar.pop
    end

    def peek
      return @ivar[-1]
    end
end