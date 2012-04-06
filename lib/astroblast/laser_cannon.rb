class LaserCannon < Chingu::GameObject  
  SPEED = 4
  INITIAL_HYPERSPACES = 2
  INITIAL_LIVES = 3
  INITIAL_SCORE = 0

  has_trait :bounding_box

  attr_accessor :score, :hyperspaces, :lives, :respawning

  def move_left;  @x -= SPEED; end
  def move_right; @x += SPEED; end

  def setup
    @score = INITIAL_SCORE
    @hyperspaces = INITIAL_HYPERSPACES
    @lives = INITIAL_LIVES
    @respawning = false

    @hyperspaces_text = Chingu::Text.create(hyperspaces, :x => 64, :y => $window.height - 64, :zorder => 55, :factor_x => 2.0, :factor_y => 2)
    @x = $window.width / 2
    @y = $window.height - 96
    @image = Image["spaceship.png"]
  end

  def fire
    LaserBlast.create(:x => @x, :y => @y - 28)
  end

  def hyperspace
    if @hyperspaces == 0
      #Sound["hyperspace_empty.wav"].play
    else
      @hyperspaces -= 1
      @hyperspaces_text.destroy
      @hyperspaces_text = Chingu::Text.create(hyperspaces, :x => 64, :y => $window.height - 64, :zorder => 55, :factor_x => 2.0, :factor_y => 2)
      @x = rand($window.width)
      Sound["hyperspace.wav"].play
    end
  end

end
