class GridVertex
  attr_accessor :up, :down, :left, :right, :corner_count

  def initialize
    # TODO make constants for undefined
    @up = @down = @left = @right = nil
    @corner_count = 0
  end

  def increment_count
    @corner_count = @corner_count + 1
  end
  def decrement_count
    @corner_count = @corner_count - 1
  end

  # TODO metaprogram the shit out of the next 4 methods
  def add_up(value)
    if @up.nil?
      @up = value
    else
      @up = @up.value
    end
  end
  def add_down(value)
    if @down.nil?
      @down = value
    else
      @down = @down.value
    end
  end
  def add_left(value)
    if @left.nil?
      @left = value
    else
      @left = @left.value
    end
  end
  def add_right(value)
    if @right.nil?
      @right = value
    else
      @right = @right.value
    end
  end

  def get_down
    return 0 if @down.nil?
    @down  
  end
  def get_up
    return 0 if @up.nil?
    @up  
  end
  def get_left
    return 0 if @left.nil?
    @left  
  end
  def get_right
    return 0 if @right.nil?
    @right  
  end

  def set_max_up(value)
    return if !@up.nil? && value <= @up 
    @up = value
  end
  def set_max_down(value)
    return if !@down.nil? && value <= @down 
    @down = value
  end
  def set_max_left(value)
    return if !@left.nil? && value <= @left 
    @left = value
  end
  def set_max_right(value)
    return if !@right.nil? && value <= @right 
    @right = value
  end

end
