class GridController < ApplicationController

def index
    grid_width = 6
    grid_height = 6
    @g = Grid.new(grid_width, grid_height)
    @tiles = Array.new

    # TODO create an iterator for Grid
    grid_height.times do |j|
        grid_width.times do |i|
            while @g.empty_area?(i,j)
                #TODO fix me up
                # get a tile
                t = Tile.new(rand(3) + 1,rand(3) + 1)

                # if we can place this tile here, do it
                if @g.empty_area?(i,j,t.width,t.height)
                    @g.mark_area(i,j,t.width,t.height,Grid::OCCUPIED)
                    t.set_location(i,j)
                    @tiles << t

                    # insert into search tree

                    # recursively search from here
                end
            end
        end
    end
    # render default index view
end

end
