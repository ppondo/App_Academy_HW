class Map
    attr_accessor :ivar

    def initialize(ivar)
        @ivar = ivar
    end

    def set(key, value)
        @ivar.each do |pair|
            if pair[0] == key
                pair[1] = value
            end
        end

        @ivar << [key, value]
    end

    def get(key)
        @ivar.each do |pair|
            if pair[0] == key
                return pair[0]
            end
        end
    end

    def delete(key)
        @ivar.each do |pair|
            if pair[0] == key
                @ivar.delete(pair)
            end
        end
    end

    def show
        @ivar
    end
end

