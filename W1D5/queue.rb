class Queue
    attr_accessor :ivar
    def initialize(ivar)
        @ivar = ivar
    end

    def peek
        @ivar[-1]
    end

    def enqueue(el)
        @ivar.unshift(el)
    end

    def dequeue
        @ivar.pop
    end
end