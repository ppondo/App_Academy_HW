class LRUCache
    attr_accessor :size, :cache

    def initialize(size)
        @size = size
        @cache = Array.new
    end

    def count
      cache.count
    end

    def add(el)
        if cache.include?(el)
            index = cache.index(el)
            cache.delete_at(index)
            cache << el
        elsif self.count < size
            cache << el 
        elsif !cache.include?(el)
            cache.delete_at(0)
            cache << el
        end
    end

    def show
      cache
    end

    private
    # helper methods go here!

  end