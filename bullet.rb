class Bullet
  PATH_TO_IMAGE = 'media/bullet.png'

  def initialize(window, tank_owner)
    @window, @tank_owner = window, tank_owner

    @image = Gosu::Image.new(window, PATH_TO_IMAGE, false)
    @x, @y = @tank_owner.x, @tank_owner.y
    @position = tank_owner.position
    @angle = 0
    @speed = 5;
  end

  def move
    case @position
    when Position::TOP
      @y -= @speed
      @angle = 0
      @tank_owner.bullets.delete(self) if @y < @window.borders.top
    when Position::BOTTOM
      @y += @speed
      @angle = 180
      @tank_owner.bullets.delete(self) if @y > @window.borders.bottom
    when Position::LEFT
      @x -= @speed
      @angle = 270
      @tank_owner.bullets.delete(self) if @x < @window.borders.left
    when Position::RIGHT
      @x += @speed
      @angle = 90
      @tank_owner.bullets.delete(self) if @x > @window.borders.right
    end
  end

  def draw
    @image.draw_rot(@x, @y, ZOrder::Bullets, @angle)
  end
end