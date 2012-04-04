class Intro < Chingu::GameState

  def setup
    self.input = { :space => Play }
    $window.caption = "Main Menu"
    @text = Chingu::Text.create("Press Space to Play!", :x => 320, :y => 200, :zorder => 55, :factor_x => 2.0, :factor_y => 2.0, :center_x => 0.5, :center_y => 0.5)
  end
end
