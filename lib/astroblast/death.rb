class Death < Chingu::GameState
  traits :timer

  def setup
    $window.caption = "Death!"
    @text = Chingu::Text.create("You died!", :x => 320, :y => 200, :zorder => 55, :factor_x => 2.0, :factor_y => 2.0, :center_x => 0.5, :center_y => 0.5)
    after(3000) { pop_game_state :setup => false, :finalize => false }
  end

  def draw
    previous_game_state.draw
  end

  
end
