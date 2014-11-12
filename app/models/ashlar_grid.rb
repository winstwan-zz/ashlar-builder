class AshlarGrid < TileGrid
  attr_accessor :tile_options

  def initialize(x,y)
    super(x,y)
  end

  # MAIN RECURSIVE FUNCTION
  # this is where all the baby-making happens
  # implements a basic depth first search
  # starting from top left to bottom right
  def fill
    i,j = self.next_unmarked_location
    # see if we are done
    return true unless i and j

    # get tile
    @tile_options.tiles.shuffle!
    t = @tile_options.get_tile

    while not t.nil?
      # if we can place this tile here, do it
      if self.empty_area?(i,j,t.width,t.height)
        self.place_tile(t,i,j)

        # how are we doing?
        # TODO ewww hardcoded integers.  max allowable edge length
        score = AshlarEvaluator.eval(self, 3)
        if score < 1
          # keep going
          done = self.fill
          return done if done
        else
          puts "Rejected tile: #{t}"
        end

        self.remove_tile(t,i,j)
      end

      # try new tile
      @tile_options.next
      t = @tile_options.get_tile
    end

    @tile_options.reset
    return false
  end
end
