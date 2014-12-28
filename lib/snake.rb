class Snake

  attr_accessor :vertabrae, :dead, :bearing
  def initialize
    @bearing = 0
    @vertabrae = []
    @dead = false
    grow(@bearing, 3, 3)
  end

  def dead?
    self.dead === true
  end

  def kill
    self.dead = true
  end

  def grow(bearing, x_coord, y_coord)
    @vertabrae.push(Vertabrae.new(bearing, x_coord, y_coord))
  end

  def change_bearing(bearing)
    self.bearing = bearing
  end
end
