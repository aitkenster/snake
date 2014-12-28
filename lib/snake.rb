class Snake

  attr_accessor :length, :dead
  def initialize
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
end
