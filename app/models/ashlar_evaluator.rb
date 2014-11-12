class AshlarEvaluator

  def self.eval(grid, max_allowed_edge)
    vertices = grid.get_vertices
    # manually loop through all vertices
    (grid.height + 1).times do |j|
      (grid.width + 1).times do |i|
        if vertices[i][j].corner_count >= 3
          return 100
        end
      end
    end

    # loop through each row except the last to check bottom edges
    (grid.height - 1).times do |j|
      running_edge = 0
      grid.width.times do |i|
        if grid.is_edge_between?(i, j, i, j+1)
          # we found an edge, so track length
          running_edge += 1
        else
          # the edge ended
          # for now, reject edges longer than the biggest tile size
          if running_edge > max_allowed_edge
            return 100
          end

          # reset running edge length
          running_edge = 0
        end
      end
    end

    # loop through each column except the last to check vertical (right side) edges
    (grid.width - 1).times do |i|
      running_edge = 0
      grid.height.times do |j|
        if grid.is_edge_between?(i, j, i+1, j)
          # we found an edge, so track length
          running_edge += 1
        else
          # the edge ended
          # for now, reject edges longer than the biggest tile size
          if running_edge > max_allowed_edge
            return 100
          end

          # reset running edge length
          running_edge = 0
        end
      end
    end

    return 0
  end

end
