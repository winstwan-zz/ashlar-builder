class Grid
    attr_accessor :width, :height
     
    # arbitrary character representations to store
    OCCUPIED      = 'x'
    EMPTY         = 'o'
    OUT_OF_BOUNDS = '-'

    def initialize(width, height)
        @width = width 
        @height = height

        # a 2d array of EMPTY, defined above
        @g = Array.new(@width) { Array.new(@height, EMPTY) }

        # a 2d array of vertices
        # TODO replace with grid of vertices
        @v = Array.new(@width + 1) { Array.new(@height + 1) { GridVertex.new } }
    end

    def set(x,y,state)
        # get representation of x, y and set it to state
        @g[x][y] = state
    end

    # alias for set()
    def mark(x,y,state = OCCUPIED)
        self.set(x,y,state)
    end

    def mark_area(x,y,width,height,state = OCCUPIED)
        width.times do |i|
            height.times do |j|
                # claim full size of tile
                self.set(x+i,y+j,state)
            end
        end
    end

    def get(x,y)
        if x >= @width or
           x < 0 or
           y >= @height or
           y < 0
           return OUT_OF_BOUNDS
        end
        @g[x][y]
    end

    def empty_area?(x,y,width = 1, height = 1)
        width.times do |i|
            height.times do |j|
                if self.get(x+i,y+j) != EMPTY
                    return false
                end
            end
        end
        true
    end

    # find the next empty location left-to-right, top-to-bottom
    # TODO slow. save this value as items are added
    def next_unmarked_location
      height.times do |j|
        width.times do |i|
          return i,j if get(i,j) == EMPTY
        end
      end
    end

    def get_vertices
      @v
    end

    def to_s
        output = ''
        @height.times do |j|
            @width.times do |i|
                output = output + @g[i][j]
            end
            output = output + "\n"
        end
        output
    end

end
