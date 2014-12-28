class Snake

  attr_accessor :length, :dead, :bearing
  def initialize
    @bearing = 0
    @length = 1
    @dead = false
  end

  def dead?
    self.dead === true
  end

  def kill
    self.dead = true
  end

  def grow 
    self.length += 1
  end

  def change_bearing(bearing)
    self.bearing = bearing
  end
end
