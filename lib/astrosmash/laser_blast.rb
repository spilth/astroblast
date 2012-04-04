class LaserBlast < Chingu::GameObject
  SPEED = 16

  traits :collision_detection, :bounding_circle, :velocity

  def setup
    @image = Image["laser_blast.png"]
    Sound["laser_blast.wav"].play(1, rand(0.5) + 0.5)
    @velocity_y = -SPEED
  end

  def update
    destroy if outside_window?
  end
end
