class Play < Chingu::GameState
  def setup
    self.input = {
      :escape => lambda{ pop_game_state },
      :p => Chingu::GameStates::Pause
    }
    $window.caption = "Play"

    @background = Chingu::GameObject.create(:image => "background.png", :x => 512, :y => 384, :zorder => 10)
    @player = LaserCannon.create
    @player.input = {
      :holding_left => :move_left,
      :holding_right => :move_right,
      :space => :fire,
      :tab => :hyperspace
    }
    @spawner = AsteroidSpawner.create
    @text = Chingu::Text.create(@player.score, :x => $window.width / 2, :y => $window.height - 64, :zorder => 55, :factor_x => 2.0, :factor_y => 2)
    @lives_text = Chingu::Text.create(@player.lives, :x => $window.width - 64, :y => $window.height - 64, :zorder => 55, :factor_x => 2.0, :factor_y => 2)
  end

  def update
    super

    Asteroid.each_collision(LaserCannon) do |asteroid, laser_cannon|
      puts "You died!"
      
      @player.lives -= 1
      @lives_text.destroy
      @lives_text = Chingu::Text.create(@player.lives, :x => $window.width - 64, :y => $window.height - 64, :zorder => 55, :factor_x => 2.0, :factor_y => 2)
      # If no lives left, go to GameOver state
      Asteroid.destroy_all
      LaserBlast.destroy_all
      # Hide Cannon
      # Show animation of exploding cannon
      push_game_state(Death)
      
      # Center cannon and show again
      @player.x = $window.width / 2
    end

    Asteroid.each_collision(LaserBlast) do |asteroid, laser_blast|
      Sound["explosion.wav"].play(1, rand(0.5) + 0.5)
      asteroid.destroy!
      @player.score += 25
      @text.destroy
      @text = Chingu::Text.create(@player.score, :x => $window.width / 2, :y => $window.height - 64, :zorder => 55, :factor_x => 2.0, :factor_y => 2)
    end
  end

end

