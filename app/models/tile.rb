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

    # return array of corner points
    def get_corners
      return unless @x and @y 
      
      return [Coord.new(@x,@y),
              Coord.new(@x+@width,@y),
              Coord.new(@x,@y+@height),
              Coord.new(@x+@width,@y+@height)]
    end

    def get_outline_coordinates
      return unless @x and @y
      points = Array.new

      # TODO inefficient
      (@height + 1).times do |j|
        (@width + 1).times  do |i|
          if j == 0 or 
             j == @height or 
             i == 0 or 
             i == @width
            points << Coord.new(i,j)  
          end
        end
      end

      return points
    end

    def self.copy(tile)
      Tile.new(tile.width, tile.height)
    end

    def to_s
        "W:#{@width},H:#{@height} at (#{x},#{y})"
    end
end
