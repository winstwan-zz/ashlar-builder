class Grid
    attr_accessor :width, :height
     
    # arbitrary character representations to store
    OCCUPIED      = 'x'
    EMPTY         = 'o'
    OUT_OF_BOUNDS = '-'

    def initialize(x,y)
        @width = x 
        @height = y

        # a 2d array of EMPTY, defined above
        @g = Array.new(@width) { Array.new(@height, EMPTY) }
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
