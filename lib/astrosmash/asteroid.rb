class Asteroid < Chingu::GameObject
  COLORS = [Color::RED, Color::GREEN, Color::YELLOW, Color::WHITE, Color::GRAY, Color::CYAN, Color::FUCHSIA, Color::BLUE, Color::AQUA]
  
  traits :effect, :velocity, :collision_detection, :bounding_circle
        
  def setup
    width = $window.width
    height = $window.height
    
    @image = Image["asteroid.png"]
 
    @color = COLORS[rand(COLORS.length)]
    @x = rand($window.width / 2) + $window.width / 4
    @y = -32
    @factor_x = 1
    @factor_y = 1
    @angle = rand(360)
    @rotation_rate = rand(10) - 5
    #@velocity_y = rand(2) + 1
    @velocity_x = rand(2) - 1
    @acceleration_x = 0.0
    @acceleration_y = 0.05
  end

end

