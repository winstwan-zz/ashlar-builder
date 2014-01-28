class Tile
    attr_accessor :x, :y
    attr_reader :width, :height

    def initialize(width, height)
        @width = width
        @height = height
    end

    def set_location(x, y)
        self.x = x
        self.y = y
    end

    def to_s
        "W:#{@width},H:#{@height} at (#{x},#{y})"
    end
end
